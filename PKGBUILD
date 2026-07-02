# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_pkgver="v2.0.0-alpha.195"
_repo="https://github.com/toitlang/toit.git"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_pkgver/vessels.tar.gz")
sha256sums=('18e3982c7a2a16825bdc76f3bf97069393bfcd89e7795c7eb6c9c92162b581e0')
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
