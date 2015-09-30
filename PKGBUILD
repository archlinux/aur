# PKGBUILD Maintainer: Tom Schneider <dev.tomschneider@gmail.com>
# bugs not related to installation should be reported on http://www.antlr3.org/
pkgname=antlr3-cplusplus-devel
pkgver=3.5.2_9.fc23
pkgrel=1
# epoch=
pkgdesc="C++ runtime support for ANTLR-generated parsers. Fedora rpm"
arch=('i686' 'x86_64')
FULLNAME_PKG="antlr3-C++-devel-${pkgver//_/-}.${CARCH}"
url='http://www.antlr3.org/'
license=('BSD')
#groups=()
#depends=()
makedepends=('rpmextract')
checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
install=${pkgname}.install
changelog=CHANGELOG
source=("ftp://rpmfind.net/linux/fedora/linux/development/rawhide/x86_64/os/Packages/a/${FULLNAME_PKG}.rpm")
noextract=("${FULLNAME_PKG}.rpm")
[ "$CARCH" == "x86_64" ] && sha256sums=('6425fa5e6fcefc2f91b896750c4a9275f0f406940bad08b86bb5e5dc530435b0')

[ "$CARCH" == "i686" ] && sha256sums=('2887d48f07c523e6413a2f5a39a2b8d1448913b228a28daa8871969e90d1e4d0')


#validpgpkeys=()

build() {
	cd $srcdir
	mkdir -p $FULLNAME_PKG; cd $FULLNAME_PKG
	rpmextract.sh "../${FULLNAME_PKG}.rpm"
}

package() {
	[ -d "$FULLNAME_PKG/usr" ] && cp -rv "$FULLNAME_PKG/usr" "$pkgdir"
	[ -d "$FULLNAME_PKG/lib" ] && cp -rv "$FULLNAME_PKG/lib" "$pkgdir"
	[ -d "$FULLNAME_PKG/var" ] && cp -rv "$FULLNAME_PKG/var" "$pkgdir"
	[ -d "$FULLNAME_PKG/opt" ] && cp -rv "$FULLNAME_PKG/opt" "$pkgdir"
	[ -d "$FULLNAME_PKG/bin" ] && cp -rv "$FULLNAME_PKG/bin" "$pkgdir"
	echo 'finished'
}
