# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_pkgver="v2.0.0-alpha.194"
_repo="https://github.com/toitlang/toit.git"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_pkgver/vessels.tar.gz")
sha256sums=('d0876eb7dc8fc01730833e2c5683609d011322700f9fbbc0153f395d08216305')
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
