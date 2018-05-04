# Maintainer: David Phillips <dbphillipsnz gmail>

pkgname=farbfeld
pkgver=4
pkgrel=2
pkgdesc="lossless image format which is easy to parse, pipe and compress"
url="https://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
conflicts=(${pkgname}-git)
source=("https://dl.suckless.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
# Sums provided upstream: https://dl.suckless.org/farbfeld/sha256sums.txt
sha256sums=('c7df5921edd121ca5d5b1cf6fb01e430aff9b31242262e4f690d3af72ccbe72a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

