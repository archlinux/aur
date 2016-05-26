# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyston
pkgver=0.5.0
pkgrel=1
pkgdesc="An open-source Python implementation using JIT techniques."
arch=('x86_64')
license=('custom')
url="https://github.com/dropbox/pyston"
depends=('libtinfo')
source=(https://github.com/dropbox/pyston/releases/download/v0.5.0/pyston-${pkgver}-linux64.tar.gz)
sha256sums=('fad0f02309d6b229ac72c0ff9c2034d2fcf1c31ecf1a5c5f21c502f17e8bfdbf')

package() {
	mkdir -p "${pkgdir}/opt/pyston"
	mkdir -p "${pkgdir}/usr/bin"
	
	cd "${srcdir}/pyston-${pkgver}-linux64/"
	cp -R * "${pkgdir}/opt/pyston"
	ln -s "/opt/pyston/pyston" "${pkgdir}/usr/bin/pyston"

	mkdir -p "${pkgdir}/usr/lib"
	ln -s /usr/lib/libtinfo.so.6 "${pkgdir}/usr/lib/libtinfo.so.5"
}

