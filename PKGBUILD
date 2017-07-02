# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-arc-themes-git
_pkgname=archlabs-arc-themes
_destname="/usr/share/themes/"
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=1
pkgdesc="Arc themes created for ARCHLabs with Arc Colora script"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-arc-themes"
license=('GPL3')
makedepends=('git')
depends=('gtk3' 'gtk-engine-murrine')
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
