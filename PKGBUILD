# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=0.4.0
pkgrel=1
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
url="https://github.com/dropbox/pyston"
depends=('libtinfo')
source=(https://github.com/dropbox/pyston/releases/download/v0.4/pyston-${pkgver}-linux64.tar.gz)
sha256sums=('438c65090abc425fe0e793c9d38e2f0e4bfe2093b933c1d57a2f6131e213b0b8')

package() {
	mkdir -p "${pkgdir}/opt/pyston"
	mkdir -p "${pkgdir}/usr/bin"
	
	cd "${srcdir}/pyston-${pkgver}-linux64/"
	cp -R * "${pkgdir}/opt/pyston"
	ln -s "/opt/pyston/pyston" "${pkgdir}/usr/bin/pyston"
}

