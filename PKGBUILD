# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_pkgver="v2.0.0-alpha.193"
_repo="https://github.com/toitlang/toit.git"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_pkgver/vessels.tar.gz")
sha256sums=('cfa2a6ce538e90893621dcfd7346de6f770cd217d7226ffb9b07eca2188f871e')
options=(!strip)

build() {
	cd "$srcdir"
	tar x -vf "vessels-$pkgver.tar.gz"
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/lib/toit/vessels"
	cp -r vessels/* "$pkgdir/usr/lib/toit/vessels/"
}
