# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

_release_number=71050
pkgname=azpainterb
pkgver=1.1.1
pkgrel=2
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://osdn.jp/frs/redir.php?f=/azpainterb/${_release_number}/${pkgname}-${pkgver}.tar.xz")
sha256sums=("2351df09b4917708e9978b9ddd91a6c469d06cbb565948ba5b27b6d4f1874c0a")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install-strip
	install -m 644 README README_ja COPYING NEWS ChangeLog GPL3 "${pkgdir}/usr/share/${pkgname}/"
}
