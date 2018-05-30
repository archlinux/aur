# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=3.3.0
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('zlib' 'xz' 'icu')
makedepends=('meson')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(043b21f39e856694492248f0bc1db037d2860360a2fe68bb2793140b216934d7)

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build -Dwerror=false
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
