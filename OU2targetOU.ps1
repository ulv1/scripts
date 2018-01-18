<#
.SYNOPSIS
  Sets Moves AD object based on -LDAPFilter from OU to target OU.
.DESCRIPTION
  Script will search through Active Directory OU and move all objects matching -LDAPfilter to target OU.
.PARAMETER $OU
    OU you limit search to, for example we've set OU to Computers for Sales department.
.NOTES
  Version:        1.0
  Author:         ulbjo
  Creation Date:  07/06/17
  Purpose/Change: Initial script development
  
.EXAMPLE
 (name=PC*) will filter search and move only PC starting with PC* to target OU.
#>

$computerstomove = Get-ADComputer -LDAPFilter "(objectClass=*)" -SearchBase "CN=Computers,DC=Umbrella,DC=Corporation,DC=com"
foreach ($computertomove in $computerstomove) {
	Move-ADObject $computertomove -TargetPath "OU=Computers,OU=Sales,DC=Umbrella,DC=Corporation,DC=com"
}

#(name=PC*)