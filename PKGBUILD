# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=chmap
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI utility to get info for Unicode characters"
arch=('x86_64' 'i686')
url="https://github.com/kiedtl/chmap/"
license=('Expat')
makedepends=('scdoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kiedtl/chmap/archive/${pkgver}.tar.gz")
sha512sums=('037151020827c9902fbac3a0e377d0429258e95fb16db2754aac7af0d00bc91b054d4d50fc9a0dd21b1fb7f6ab1d430c8d39e56a9fa26835e7504cd1c202b769')

build() {
	cd ${pkgname}-${pkgver}

	make VERBOSE=1
}

package() {
	cd ${pkgname}-${pkgver}

	make PREFIX=/usr DESTDIR=${pkgdir} VERBOSE=1 install
	# Install licence file.
	install -Dvm644 LICENSE.md -t ${pkgdir}/usr/share/licenses/${pkgname}
}
