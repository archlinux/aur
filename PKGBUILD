# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-wallpapers-4k-git
_pkgname=archlabs-wallpapers-4k
_destname="/usr/share/backgrounds/archlabs-4k/"
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=1
pkgdesc="4k Wallpapers for ArchLabs"
arch=('any')
url="https://github.com/ARCHLabs/archlabs-wallpapers-4k"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+https://github.com/ARCHLabs/${_pkgname}.git")
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	mkdir -p "${pkgdir}${_destname}"
	mkdir -p "${pkgdir}${_licensedir}${_pkgname}"
	mv "${srcdir}/${_pkgname}/"LICENSE "${pkgdir}${_licensedir}${_pkgname}/LICENSE"	
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
