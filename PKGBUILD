# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=1.5.0
pkgrel=1
pkgdesc='Fast port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg' 'cairo')
source=("https://www.mg0.fr/oshu/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('c1302b84774bedc05bfeacbc5df3e6a12e21763a4776ed311006a94f7a3f689b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
