# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=nexttool-svn
pkgver=r654
pkgrel=1
pkgdesc="Communication tool for the LEGO Mindstorms NXT programmable brick"
arch=('i686' 'x86_64')
url="http://bricxcc.sourceforge.net/utilities.html"
license=('MPL')
groups=()
depends=('libusb-compat')
makedepends=('subversion' 'fpc')
provides=('nexttool')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('svn+https://svn.code.sf.net/p/bricxcc/code/')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/code"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
	cd "$srcdir/code"
	make -f nexttool.mak
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/code/nexttool" "$pkgdir/usr/bin"
}
