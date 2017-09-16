# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr2

pkgname='oshu'
pkgver=1.2.0
pkgrel=1
pkgdesc='Lightweight port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2 sdl2_image ffmpeg')
source=("https://github.com/fmang/oshu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('2c92174c13529d8fc4fc49f31116bd4458462543')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
