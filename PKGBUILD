# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
_pkgname=MapTool
pkgver=1.5.5
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('f6b431564092a48cc0929a645e7f54320cbd9b049d8e2254e02a0af05da24631')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

}
