# Contributor: Egor Malyutin <egorcod.tk@gmail.com>

pkgname="colors-pacmans"
pkgver="1.0"
pkgrel="1"
pkgdesc="Pacmans displays terminal's color pallete."
arch=('i686' 'x86_64')
url='https://crunchbang.org/forums/viewtopic.php?pid=126921%23p126921#p126921'
license=('unknown')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=()
noextract=()
md5sums=()

package() {
	cd $pkgdir

	# Create work dirs
	mkdir -p usr usr/bin
	
	# Write a small script
	echo '#!/bin/bash

# Using this script - https://crunchbang.org/forums/viewtopic.php?pid=126921%23p126921#p126921

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the off
#    feature for anything you turn on.

if [[ $1 == "-h" || $1 == "--h" || $1 == "-help" || $1 == "--help" ]]
then
	echo
	echo	"	USAGE:"
	echo        
	echo	"		color-pacmans"
	echo
	echo	"	DESCRIPTION:"
	echo
	echo	"		Pacmans displays terminal color pallete."
	echo
	echo	"	OPTIONS:"
	echo
	echo	"		-h, --help	Display this help message"

	exit
fi

initializeANSI() {
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

initializeANSI

cat << EOF

 ${yellowf}  ▄███████▄${reset}   ${redf}  ▄██████▄${reset}    ${greenf}  ▄██████▄${reset}    ${bluef}  ▄██████▄${reset}    ${purplef}  ▄██████▄${reset}    ${cyanf}  ▄██████▄${reset}
 ${yellowf}▄█████████▀▀${reset}  ${redf}▄${whitef}█▀█${redf}██${whitef}█▀█${redf}██▄${reset}  ${greenf}▄${whitef}█▀█${greenf}██${whitef}█▀█${greenf}██▄${reset}  ${bluef}▄${whitef}█▀█${bluef}██${whitef}█▀█${bluef}██▄${reset}  ${purplef}▄${whitef}█▀█${purplef}██${whitef}█▀█${purplef}██▄${reset}  ${cyanf}▄${whitef}█▀█${cyanf}██${whitef}█▀█${cyanf}██▄${reset}
 ${yellowf}███████▀${reset}      ${redf}█${whitef}▄▄█${redf}██${whitef}▄▄█${redf}███${reset}  ${greenf}█${whitef}▄▄█${greenf}██${whitef}▄▄█${greenf}███${reset}  ${bluef}█${whitef}▄▄█${bluef}██${whitef}▄▄█${bluef}███${reset}  ${purplef}█${whitef}▄▄█${purplef}██${whitef}▄▄█${purplef}███${reset}  ${cyanf}█${whitef}▄▄█${cyanf}██${whitef}▄▄█${cyanf}███${reset}
 ${yellowf}███████▄${reset}      ${redf}████████████${reset}  ${greenf}████████████${reset}  ${bluef}████████████${reset}  ${purplef}████████████${reset}  ${cyanf}████████████${reset}
 ${yellowf}▀█████████▄▄${reset}  ${redf}██▀██▀▀██▀██${reset}  ${greenf}██▀██▀▀██▀██${reset}  ${bluef}██▀██▀▀██▀██${reset}  ${purplef}██▀██▀▀██▀██${reset}  ${cyanf}██▀██▀▀██▀██${reset}
 ${yellowf}  ▀███████▀${reset}   ${redf}▀   ▀  ▀   ▀${reset}  ${greenf}▀   ▀  ▀   ▀${reset}  ${bluef}▀   ▀  ▀   ▀${reset}  ${purplef}▀   ▀  ▀   ▀${reset}  ${cyanf}▀   ▀  ▀   ▀${reset}
 
 ${boldon}${yellowf}  ▄███████▄   ${redf}  ▄██████▄    ${greenf}  ▄██████▄    ${bluef}  ▄██████▄    ${purplef}  ▄██████▄    ${cyanf}  ▄██████▄${reset}
 ${boldon}${yellowf}▄█████████▀▀  ${redf}▄${whitef}█▀█${redf}██${whitef}█▀█${redf}██▄  ${greenf}▄${whitef}█▀█${greenf}██${whitef}█▀█${greenf}██▄  ${bluef}▄${whitef}█▀█${bluef}██${whitef}█▀█${bluef}██▄  ${purplef}▄${whitef}█▀█${purplef}██${whitef}█▀█${purplef}██▄  ${cyanf}▄${whitef}█▀█${cyanf}██${whitef}█▀█${cyanf}██▄${reset}
 ${boldon}${yellowf}███████▀      ${redf}█${whitef}▄▄█${redf}██${whitef}▄▄█${redf}███  ${greenf}█${whitef}▄▄█${greenf}██${whitef}▄▄█${greenf}███  ${bluef}█${whitef}▄▄█${bluef}██${whitef}▄▄█${bluef}███  ${purplef}█${whitef}▄▄█${purplef}██${whitef}▄▄█${purplef}███  ${cyanf}█${whitef}▄▄█${cyanf}██${whitef}▄▄█${cyanf}███${reset}
 ${boldon}${yellowf}███████▄      ${redf}████████████  ${greenf}████████████  ${bluef}████████████  ${purplef}████████████  ${cyanf}████████████${reset}
 ${boldon}${yellowf}▀█████████▄▄  ${redf}██▀██▀▀██▀██  ${greenf}██▀██▀▀██▀██  ${bluef}██▀██▀▀██▀██  ${purplef}██▀██▀▀██▀██  ${cyanf}██▀██▀▀██▀██${reset}
 ${boldon}${yellowf}  ▀███████▀   ${redf}▀   ▀  ▀   ▀  ${greenf}▀   ▀  ▀   ▀  ${bluef}▀   ▀  ▀   ▀  ${purplef}▀   ▀  ▀   ▀  ${cyanf}▀   ▀  ▀   ▀${reset}

EOF' >> usr/bin/colors-pacmans

	chmod +x usr/bin/colors-pacmans

}
