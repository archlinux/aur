# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azpainterb
pkgver=1.1.3b1
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("http://azsky2.html.xdomain.jp/arc/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a14af734209171f0df563b68702f8b9b4e832444dbe366cabd726fca873ec8af')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make \
		prefix="${pkgdir}/usr" \
		bindir="${pkgdir}/usr/bin" \
		datarootdir="${pkgdir}/usr/share" \
		datadir="${pkgdir}/usr/share/azpainterb" \
		install
}
