# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-beta-bin
_pkgname=maptool
_PkgName=MapTool
pkgver=1.6.0
_pkgver=${pkgver}-beta-1
pkgrel=1
pkgdesc="An open source virtual tabletop program, 1.6 beta release"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${_pkgver}/maptool-${_pkgver}.deb")
sha256sums=('5723fad620a0cd16c69521ece8c356b2a82643fb2685b35302c89ab21baae4cd')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_PkgName}/${_PkgName}.desktop" -t "${pkgdir}/usr/share/applications/"

}
