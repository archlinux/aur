# Maintainer: Florian Loitsch <florian@toit.io>

pkgname='toit-vessels-bin'
_tag="v2.0.0-alpha.146"
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
sha256sums=('e4f243a97c6e9a1ce1a74b63cf9fdbf9a7d63b17d42b4415bead3d2ab4ea4bda')
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
