# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_tag="v2.0.0-alpha.162"
_repo="https://github.com/toitlang/toit.git"
_tag_no_dash="${_tag//-/}"
pkgver="${_tag_no_dash#v}"
pkgrel=1
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
depends=("toit=$pkgver")
source=("vessels-$pkgver.tar.gz::https://github.com/toitlang/toit/releases/download/$_tag/vessels.tar.gz")
sha256sums=('942302c0e4e430e7c5d41f2d13866011a50551110643577b7ff0bd19e7be9fc2')
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
