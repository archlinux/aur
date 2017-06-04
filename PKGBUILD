# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

_release_number=67806
pkgname=azpainterb
pkgver=1.0.9
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/${_release_number}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=("72210d288e8a4adfa5d194d57a34278417906ae567a599524be40284e16d9a07")

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
