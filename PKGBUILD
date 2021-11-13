# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=apdtool
pkgver=1.1.1
pkgrel=1
pkgdesc="CUI Tool for APD/ADW file"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/apdtool.html"
license=('MIT')
depends=('libpng' 'zlib')
source=("https://gitlab.com/azelpg/apdtool/-/archive/v${pkgver}/apdtool-v${pkgver}.tar.gz")
sha256sums=('bd16746cd9044e954b94888a228510efd0e8c7e2fa65d562bcdeb3d4d1a4aaec')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	make \
		bindir="${pkgdir}/usr/bin" \
		docdir="${pkgdir}/usr/share/apdtool" \
		install
}
