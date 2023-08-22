# Maintainer: Bernardo Kuri <aur+drawingbot-v3@bkuri.com>
pkgname=drawingbot-v3
pkgver=1.6.5
pkgrel=1
pkgdesc="DrawingBotV3 is a software for converting images into vector art"
arch=('x86_64')
url="https://github.com/SonarSonic/DrawingBotV3"
license=('GPLv3')
provides=('drawingbot-v3')
groups=('')
depends=('gephi' 'xdg-utils' 'zlib')
makedepends=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/SonarSonic/DrawingBotV3/releases/download/v${pkgver}-stable-free/DrawingBotV3-Free-${pkgver}-stable-linux.deb")
sha512sums_x86_64=('41ae8a7f02515cb7b7644836bf3848854581e7ff58244f0db198ee45f212c54917574c4ab914caff8d36427070770398426ef6073d0e80cd59c377f83443d66c')

package(){
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/lib/runtime/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
