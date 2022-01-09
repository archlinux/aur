# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kamil Cukrowski <kamil@dyzio.pl>
# Contributor: Mehmet Akif <makiftasova@gmail.com>
# picpgm author: Christian Stadler
pkgname=picpgm
pkgver=2.9.3.1
pkgrel=2
epoch=
pkgdesc="The PICPgm Development Programmer Software is a free and simple In-System-Development Programmer Software for the Microchip PIC microcontrollers."
arch=( "i686" "x86_64" )
url="http://picpgm.picprojects.net"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("http://picpgm.picprojects.net/download/${pkgname}-${pkgver}-linux-i386.tar.gz")
source_x86_64=("http://picpgm.picprojects.net/download/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
noextract=()
sha256sums_i686=('cf7c21e6e51d8d6ac6ca717e706f902a21089dad2533cecda5d3671d83ca6f5a')
sha256sums_x86_64=('a986e9c8c7768ae550b6c6d5f21d20e5dc6d006d3608dd7cc37b5e40183e0b47')
validpgpkeys=()

package() {
	install -d "$pkgdir"/opt/picpgm
	install -d "$pkgdir"/usr/bin
	install -m 755 -o root -g root ./picpgm         "$pkgdir"/opt/picpgm
	install -m 666 -o root -g root ./pgmifcfg.xml   "$pkgdir"/opt/picpgm
	install -m 666 -o root -g root ./disclaimer.txt "$pkgdir"/opt/picpgm
	ln -s /opt/picpgm/picpgm  "$pkgdir"/usr/bin/picpgm
}

