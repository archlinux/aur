# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
_pkgname=MapTool
pkgver=1.5.7
pkgrel=2
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('6548ec14d09b978e74e77cdea98e131d0a06b31f26dad33b66bc6213cad66361')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

}
