# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=0.6.1
pkgrel=1
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
url="https://github.com/dropbox/pyston"
depends=('ncurses5-compat-libs')
source=(https://github.com/dropbox/pyston/releases/download/v${pkgver}/pyston-${pkgver}-linux64.tar.gz)
sha256sums=('b09516d8e421cb004ef39d832bae600face4ecf80d9791469fb2c026bcf1faae')

package() {
	mkdir -p "${pkgdir}/opt/pyston"
	mkdir -p "${pkgdir}/usr/bin"
	
	cd "${srcdir}/pyston-${pkgver}-linux64/"
	cp -R * "${pkgdir}/opt/pyston"
	ln -s "/opt/pyston/pyston" "${pkgdir}/usr/bin/pyston"

	mkdir -p "${pkgdir}/usr/lib"
	ln -s /usr/lib/libreadline.so.7 "${pkgdir}/usr/lib/libreadline.so.6"
}

