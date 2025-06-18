# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_pkgver="v2.0.0-alpha.185"
_repo="https://github.com/toitlang/toit.git"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_pkgver/vessels.tar.gz")
sha256sums=('c38e1f10150ee3013e963d96572d801cfb722952437407019a6e79e4db19936f')
options=(!strip)

build() {
	cd "$srcdir"
	tar x -vf "vessels-$pkgver.tar.gz"
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/toit-sdk/vessels"
	cp -r vessels/* "$pkgdir/opt/toit-sdk/vessels/"
}
