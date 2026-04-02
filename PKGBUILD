# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_pkgver="v2.0.0-alpha.191"
_repo="https://github.com/toitlang/toit.git"
_pkgver_no_dash="${_pkgver//-/}"
pkgver="${_pkgver_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_pkgver/vessels.tar.gz")
sha256sums=('0a80d71a73a810117d2bbaf9e89f9fcc56182addffd456d0863d9cb18cb41a96')
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
