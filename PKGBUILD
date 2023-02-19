# Maintainer: Daniel Dimijian <jetfrog28@yahoo.com>
_prjctname=GodotPckTool
pkgname=godotpcktool
pkgver=1.8
pkgrel=1
pkgdesc="A standalone executable for unpacking and packing Godot .pck files"
arch=('x86_64')
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'cxxopts' 'nlohmann-json')
# source unsigned.  git commits are signed, but I can't find the public key for the tagged commits
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dad9ace4ffadc3137c992faa72edf1659cb6d5629b6ab1c496cc705e62d2bb7f')

build() {
	cd "$_prjctname-$pkgver"

	make install-local
}

package() {
	cd "$_prjctname-$pkgver"

	install -Dm755 "install/bin/godotpcktool" "$pkgdir/usr/bin/godotpcktool"
	install -Dm644 "install/bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
