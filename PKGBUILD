# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=ffs-editor
pkgname=freecalypso-ffs-editor-bin
pkgver=r2
pkgrel=1
pkgdesc="FreeCalypso FFS (Flash File System) editor firmware images"
arch=('any')
url="https://www.freecalypso.org/hg/${_pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname=${_pkgname}-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2")
sha256sums=('6384f6aed462bac1f035b313a3e43382af06e0217a19b759e07dbcd5a570c5d2')

package() {
	cd "${_tarname}"

	# XXX: no docs, no LICENSE file

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
