# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-plank-themes-git
_pkgname=archlabs-plank-themes
_destname="/usr/share/plank/themes/"
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=1
pkgdesc="Plank themes for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Plank-Themes"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=()
provides=("${pkgname}")
options=(!strip !emptydirs)
source=('archlabs-plank-themes::git+https://github.com/ARCHLabs/Archlabs-Plank-Themes.git')
sha256sums=('SKIP')
package() {
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	mkdir -p "${pkgdir}${_destname}"
	mkdir -p "${pkgdir}${_licensedir}${_pkgname}"
	mv "${srcdir}/${_pkgname}/"LICENSE "${pkgdir}${_licensedir}${_pkgname}/LICENSE"	
	cp -r "${srcdir}/${_pkgname}/themes/"* "${pkgdir}${_destname}"
}
