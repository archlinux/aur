# Maintainer: Bernardo Kuri <aur+drawingbot-v3@bkuri.com>
pkgname=drawingbot-v3
pkgver=1.6.25
pkgrel=1
pkgdesc="DrawingBotV3 is a software for converting images into vector art"
arch=('x86_64')
url="https://github.com/SonarSonic/DrawingBotV3"
license=('GPLv3')
provides=('drawingbot-v3')
groups=()
depends=('gephi' 'xdg-utils' 'zlib')
makedepends=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/SonarSonic/DrawingBotV3/releases/download/v${pkgver}-stable-free/DrawingBotV3-Free-${pkgver}-stable-linux-x86-64.deb")
sha256sums_x86_64=('30657ed21f5a97139c63d3e59f6ac5793fc5ab8bebbf30fe205f3342c5a4eb6a')

package(){
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/lib/runtime/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/lib/drawingbotv3-DrawingBotV3-Free.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
