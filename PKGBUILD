# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-beta-bin
_pkgname=maptool
_PkgName=MapTool
pkgver=1.6.0
_pkgver=${pkgver}-beta-2
pkgrel=2
pkgdesc="An open source virtual tabletop program, 1.6 beta release"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${_pkgver}/maptool-${_pkgver}.deb")
sha256sums=('f5acdf3a594c7033571df59c5bddda5510f26772e1e99d7bc211531e26e943db')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_PkgName}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_PkgName}/${_PkgName}.desktop" -t "${pkgdir}/usr/share/applications/"

}
