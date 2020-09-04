# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=aes
pkgver=0.2.0
pkgrel=1
pkgdesc="encryption utility with very simple interface"
arch=('any')
url="https://github.com/x1b6e6/aes"
license=("MIT")
depends=("libgcrypt" "docopt")
makedepends=("gcc" "make" "cmake")

source=("${pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip")

sha1sums=("2c2bb9f14f3a9e1cbc02ff13c061aa101ddd78ef")

build(){
	cd $srcdir/${pkgname}-${pkgver}
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname}-${pkgver}/build/aes" "$pkgdir/usr/bin/aes"
}

# vim: set ts=4 sw=4 :
