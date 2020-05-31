# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid=vscode-search-provider@jomik.org
pkgname=gnome-shell-extension-vscode-search-provider
pkgver=16
pkgrel=1
pkgdesc="Add recent VSCode projects to Gnome Shell search"
arch=('any')
url="https://github.com/Jomik/vscode-search-provider"
license=('MIT')
depends=('gnome-shell>=3.34')
source=(
	"$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip"
	"https://raw.githubusercontent.com/Jomik/vscode-search-provider/v$pkgver/LICENSE"
)
md5sums=('ba887105a843f650d9e4318268c299c4'
	'b400106cc2bda3124008645a217c10bd')
sha1sums=('bbf0db9391aefad7f498b9a4906e796d88bc6be3'
	'f930f495d8cf7f1d067c192462132c1e5a62b8d5')
sha512sums=('5fc8ba1bb99d9de7b7146214c43a95d7d9ae88bbe3eb5e7382fdd38272692a6737d6fbf716e90adb282045480fc675ce66f8263cc29c54182e4c6e19f87f413f'
	'e0fc0bdebe6fcd1d086671a7d98331d52dccb7782bdabdc3a36166b5e5febc6ddfe822c8193282782eb7d5fe291c203fa90562fd640e2afc061de903f40151dc')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js prefs.xml schemas/gschemas.compiled schemas/*.xml
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
