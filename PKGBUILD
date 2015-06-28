# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Christoph Zeiler <rabyteNOSPAM _at_ gmx.d0t.net>
# Contributor: Nathan Owe <ndowens04+AUR at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=base91
pkgver=0.6.0
pkgrel=6
pkgdesc='An advanced method for encoding binary data to ASCII text'
arch=('i686' 'x86_64')
url='http://base91.sourceforge.net/'
license=('BSD')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('02cfae7322c1f865ca6ce8f2e0bb8d38c8513e76aed67bf1c94eab1343c6c651')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	sed -i '/^\(C\|LD\)FLAGS/s/=/+=/' Makefile
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix='/usr' DESTDIR="${pkgdir}" install
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

