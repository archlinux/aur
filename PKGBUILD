# Maintainer: Bernardo Kuri <aur+drawingbot-v3@bkuri.com>
pkgname=drawingbot-v3
pkgver=1.5.3
pkgrel=3
pkgdesc="DrawingBotV3 is a software for converting images into vector art"
arch=('x86_64')
url="https://github.com/SonarSonic/DrawingBotV3"
license=('GPLv3')
groups=('')
depends=('gephi' 'xdg-utils' 'zlib')
makedepends=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/SonarSonic/DrawingBotV3/releases/download/v1.5.3-stable-free/DrawingBotV3-Free-1.5.3-stable-linux.deb")
sha512sums_x86_64=('83505a99fd5899ea7aa99933499940de3b91c86f9a5a9ac550c0b9eaeb7c75c5e1a2bbb141c0ec14c47ea0aea83f35b99f6d2840eaf8f8cec35e10bb84d58378')

package(){
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/lib/runtime/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/drawingbotv3/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
