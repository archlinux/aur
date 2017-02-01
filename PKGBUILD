# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

_release_number=67026
pkgname=azpainterb
pkgver=1.0.5
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/${_release_number}/${pkgname}-${pkgver}.tar.bz2")
sha1sums=("326d827052800a6034f1407769eb320b516ac0e0")

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
