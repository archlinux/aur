# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=2.0.1
pkgrel=1
pkgdesc='Fast port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg' 'cairo' 'pango')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmang/oshu/archive/$pkgver.tar.gz")
sha256sums=('ae538aa02aa6058d0dc9db2b60feb07edda5f62c4cc6a3d8efae7d918a7c1003')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOSHU_DEFAULT_SKIN=osu
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
