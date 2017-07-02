# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-common-git
_pkgname=archlabs-common
_destname="/usr/lib/archlabs/common/"
pkgver=2.0
pkgrel=0
pkgdesc="Arc themes created for ARCHLabs with Arc Colora script"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Common"
license=('GPL3')
makedepends=('git')
depends=()
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+https://github.com/ARCHLabs/${_pkgname}.git")
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
