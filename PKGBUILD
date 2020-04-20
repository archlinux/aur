# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
_pkgname=MapTool
pkgver=1.6.1
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('411a4993cf5e80429f32df8f9b89be80abce8de738a4ffae7dee784e6e1eeebb')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

}
