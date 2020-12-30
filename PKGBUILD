# Maintainer: Daniel Dimijian <jetfrog28@yahoo.com>
_prjctname=GodotPckTool
pkgname=godotpcktool
pkgver=1.4
pkgrel=1
pkgdesc="A standalone executable for unpacking and packing Godot .pck files"
arch=('x86_64')
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'cxxopts' 'nlohmann-json')
# source unsigned.  git commits are signed, but I can't find the public key for the tagged commits
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('84d2264c3e0f89dbabf8707a90966610fc7c0c1e0bff8b278e81d71e26aa0121')

build() {
	cd "$_prjctname-$pkgver"

	make install-local
}

package() {
	cd "$_prjctname-$pkgver"

	install -Dm755 "install/bin/godotpcktool" "$pkgdir/usr/bin/godotpcktool"
	install -Dm644 "install/bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
