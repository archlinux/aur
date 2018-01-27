# Maintainer: Frédéric Mangano-Tarumi <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=1.6.0
pkgrel=1
pkgdesc='Fast port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg' 'cairo' 'pango')
source=("https://www.mg0.fr/oshu/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('2edcbf1ca9f9664b4d6253c24eb1a10c0c66d0e09d9968675f969d9e74d54dad')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
