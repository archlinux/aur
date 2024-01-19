# Maintainer: Angelo Dal Zotto <angelodalzotto97 at gmail dot com>
pkgname=ns-usbloader
pkgver=7.1
pkgrel=1
pkgdesc="Awoo Installer/TinFoil/GoldLeaf NSPs (and other files) uploader and RCM tool."
arch=('any')
url="https://github.com/developersu/ns-usbloader"
license=('GPL3')
depends=(
	'java-runtime>=11'
)
optdepends=(
	'nx-udev: udev rules to run without root'
)
source=(
	"https://github.com/developersu/ns-usbloader/releases/download/v$pkgver/$pkgname-$pkgver.jar"
	"$pkgname"
	"$pkgname.desktop"
)
sha256sums=('8f70ea1eeee62ca3485039255cf90e8adf6f86cb7c2440451dfb54f0015863e6'
            'd00fc704b669bb00f9e26bd70ea784015921c1f4825a8320b1e8f1f1f70ba6e5'
            'f78baea7e90bc5c48215c938add3fc49e11b51208df69d9460769d2e27ca9877')

package() {
	install -Dm 644 res/app_icon32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm 644 res/app_icon48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -Dm 644 res/app_icon64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	install -Dm 644 res/app_icon128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm 755 "$pkgname-$pkgver.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm 755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 $pkgname.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
