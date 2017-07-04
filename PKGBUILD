# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-rofi-themes-git
_pkgname=archlabs-rofi-themes
_destname="/usr/share/rofi/themes/"
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=2
pkgdesc="Rofi Themes for ArchLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Rofi-Themes"
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
