# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=2.0.0
pkgrel=1
pkgdesc='Fast port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg' 'cairo' 'pango')
makedepends=('cmake')
source=("https://www.mg0.fr/oshu/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('43d25bee21a4932c6e17a9a667fcd8b8459960f1da6eca63e426fb85be963ad1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DOSHU_DEFAULT_SKIN=osu
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
