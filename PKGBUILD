# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-slimlock-themes-git
_pkgname=archlabs-slimlock-themes
_destname="/usr/share/slim/themes/"
_destname2="/etc/"
pkgver=1.2
pkgrel=3
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
	mkdir -p "${pkgdir}${_destname2}"
	rm -f "${srcdir}/${_pkgname}/"README.md
	rm -f "${srcdir}/${_pkgname}/"git-v*
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}${_destname}"
}
