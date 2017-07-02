# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-docs-git
_pkgname=archlabs-docs
_destname="/usr/share/archlabs/docs/"
pkgver=2.0
pkgrel=0
pkgdesc="Documentation created for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Docs"
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
