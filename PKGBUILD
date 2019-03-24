# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('6c33d11f1012c2656fdf1aefd2c2c787dfd5ab5f8dab081d5f8c58c999ba64de')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -Dm644 "${pkgdir}/opt/MapTool/MapTool.desktop" "${pkgdir}/usr/share/applications/MapTool.desktop"

}
