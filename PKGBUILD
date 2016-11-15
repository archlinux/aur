# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=0.5.1
pkgrel=3
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
url="https://github.com/dropbox/pyston"
depends=('ncurses5-compat-libs')
source=(https://github.com/dropbox/pyston/releases/download/v${pkgver}/pyston-${pkgver}-linux64.tar.gz)
sha256sums=('4b0d2ad2c19f6393b79adbb9312649d38cb8cb3daf0c8fdf8631465c7761bb79')

package() {
	mkdir -p "${pkgdir}/opt/pyston"
	mkdir -p "${pkgdir}/usr/bin"
	
	cd "${srcdir}/pyston-${pkgver}-linux64/"
	cp -R * "${pkgdir}/opt/pyston"
	ln -s "/opt/pyston/pyston" "${pkgdir}/usr/bin/pyston"

	mkdir -p "${pkgdir}/usr/lib"
	ln -s /usr/lib/libreadline.so.7 "${pkgdir}/usr/lib/libreadline.so.6"
}

