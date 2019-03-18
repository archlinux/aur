# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="An open source virtual tabletop program, now infused with Nerps!"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('a4a90b6c9bbd0ed4943741e31cbbd27adf1b3493d5a83856c276b9d580fbdcd1')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -Dm644 "${pkgdir}/opt/MapTool/MapTool.desktop" "${pkgdir}/usr/share/applications/MapTool.desktop"

}
