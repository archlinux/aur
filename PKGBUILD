# Maintainer: Daniel Dimijian <jetfrog28@yahoo.com>
_prjctname=GodotPckTool
pkgname=godotpcktool
pkgver=1.6
pkgrel=1
pkgdesc="A standalone executable for unpacking and packing Godot .pck files"
arch=('x86_64')
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'cxxopts' 'nlohmann-json')
# source unsigned.  git commits are signed, but I can't find the public key for the tagged commits
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('58422d7ff651e5c7ab11d136a176ae12dedfaf0018171357d489f309646ebbd9')

build() {
	cd "$_prjctname-$pkgver"

	make install-local
}

package() {
	cd "$_prjctname-$pkgver"

	install -Dm755 "install/bin/godotpcktool" "$pkgdir/usr/bin/godotpcktool"
	install -Dm644 "install/bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
