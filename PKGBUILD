# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kamil Cukrowski <kamil@dyzio.pl>
# picpgm author: Christian Stadler
pkgname=picpgm
pkgver=2.9.2.3
pkgrel=1
epoch=
pkgdesc="The PICPgm Development Programmer Software is a free and simple In-System-Development Programmer Software for the Microchip PIC microcontrollers."
arch=( "i686" "x86_64" )
url="picpgm.picprojects.net"
license=('GPL')
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
source=("http://picpgm.picprojects.net/download/${pkgname}-${pkgver}-linux-i386.tar.gz")
noextract=()
md5sums=("5a54cb6b3a146409e19d5b4039bcb804")
validpgpkeys=()

package() {
	install -d $pkgdir/opt/picpgm
	install -d $pkgdir/usr/bin
	install -m 755 -o root -g root ./picpgm $pkgdir/opt/picpgm
	install -m 666 -o root -g root ./pgmifcfg.xml $pkgdir/opt/picpgm
	install -m 666 -o root -g root ./disclaimer.txt $pkgdir/opt/picpgm
	ln -s /opt/picpgm/picpgm  $pkgdir/usr/bin/picpgm
}

