# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-slimlock-themes-git
_pkgname=archlabs-slimlock-themes
_destname="/usr/share/slim/themes/"
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=1
pkgdesc="Slimlock themes created for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Slimlock-Themes"
license=('GPL3')
makedepends=('git')
depends=('xfce-slimlock')
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
