# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=1.3.0
pkgrel=1
pkgdesc='Lightweight port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2 sdl2_image ffmpeg')
source=("https://www.mg0.fr/oshu/$pkgname-$pkgver.tar.gz")
sha1sums=('b0bb4f58c47826f1fe88910b88c4bc23ed76d8e8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
