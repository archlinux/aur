# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

_release_number=72785
pkgname=azpainterb
pkgver=1.1.2
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/${_release_number}/${pkgname}-${pkgver}.tar.xz")
sha256sums=("0dcc5b70df720ee98f03133e0255a2e2925af2fb0edb2e524bb1dad3fbe503d9")

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
