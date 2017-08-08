# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=1.0.0
pkgrel=1
pkgdesc='Lightweight port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2 ffmpeg')
source=("https://github.com/fmang/oshu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('1068eca154a9924a4944d3ef883a11ae0b2892a5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
