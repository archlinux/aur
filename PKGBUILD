# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

_release_number=67714
pkgname=azpainterb
pkgver=1.0.8
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/${_release_number}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=("42bc561ee1ed1d5d35695d4fbf4d3a1c6a629151fadbebe1885d6e0010faed49")

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
