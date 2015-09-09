# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=miceamaze
pkgver=4.2.1
pkgrel=2
pkgdesc="A free video game that features a maze with mice and snakes"
arch=('i686' 'x86_64')
url="http://www.miceamaze.org/"
license=('BSD')
depends=('hicolor-icon-theme' 'mesa' 'quesoglc' 'sdl' 'sdl_mixer' 'soil' 'ttf-dejavu')
install=miceamaze.install
source=("http://www.miceamaze.org/source-packages/miceamaze-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/miceamaze-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/miceamaze-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

md5sums=('36b91880582c5292962a4b9be9655508')
