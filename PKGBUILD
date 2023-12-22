# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=ffs-editor
pkgname=freecalypso-ffs-editor-bin
pkgver=r3
pkgrel=1
pkgdesc="FreeCalypso FFS (Flash File System) editor firmware images"
arch=('any')
url="https://www.freecalypso.org/hg/${_pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname=${_pkgname}-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2")
sha256sums=('62c1b5031a0c53e0522b1a798fde605f0e61b40949336e3ef60cfa932e5f4a0b')

package() {
	cd "${_tarname}"

	# XXX: no docs, no LICENSE file

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
