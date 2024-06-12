# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_tag="v2.0.0-alpha.156"
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
sha256sums=('70bf17c7eb48ad1c6da6a3a7c69e568b6ed016ec3999a526123872ad7b050d72')
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
