# Maintainer: Konstantin <konstantin.z100@gmail.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="lcdtest"
pkgver=1.18
pkgrel=3
pkgdesc="A utility to display LCD monitor test patterns."
arch=('i686' 'x86_64')
# The original URL of the author's website is no longer available. I transferred its source codes via web.archive.org on github.
# url="http://www.brouhaha.com/~eric/software/lcdtest/"
url="https://github.com/Energoblock/lcdtest/"
license=('GPL2')
depends=('sdl_image' 'sdl_ttf' 'ttf-liberation')
makedepends=('scons')
#source=("http://www.brouhaha.com/~eric/software/lcdtest/download/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/Energoblock/lcdtest/releases/download/1.18/${pkgname}-${pkgver}.tar.gz")

sha512sums=('74b0739c5dcc5ff9307ca526b4a6bbd92d6e58a83ceeed5a37a4064e3e4ed0cbdfe7a2a70cd56ba1a7305c3fd72510e10a02098aab11828062a3999cac944ab7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	scons
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	install -d -m0755 ${pkgdir}/usr/bin
	install -m0755 ${srcdir}/${pkgname}-${pkgver}/src/${pkgname} ${pkgdir}/usr/bin
	install -d -m0755 ${pkgdir}/usr/share/man/man1
	install -m0644 ${srcdir}/${pkgname}-${pkgver}/man/${pkgname}.1 ${pkgdir}/usr/share/man/man1
}

# vim:ts=4:sw=4:noet:
