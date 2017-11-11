# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=1.4.0
pkgrel=1
pkgdesc='Lightweight port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg')
source=("https://www.mg0.fr/oshu/$pkgname-$pkgver.tar.gz")
sha256sums=('b82137dc172afc7c9d1021a248fa314cc14445859fc1a77c5bc9beb497692249')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
