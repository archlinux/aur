# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azpainterb
pkgver=1.0.2
pkgrel=2
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/66065/${pkgname}-${pkgver}.tar.bz2")
sha1sums=("21a5cf30e6e2ca57a6b24782d0859f2c4864bc4e")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install-strip
	install -m 644 README README_ja COPYING NEWS ChangeLog GPL3 BSD "${pkgdir}/usr/share/${pkgname}/"
}
