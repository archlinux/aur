# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-vscode-search-provider
pkgver=15
pkgrel=1
pkgdesc="Add recent VSCode projects to Gnome Shell search"
arch=('any')
url="https://github.com/Jomik/vscode-search-provider"
license=('MIT')
depends=('gnome-shell>=3.34')
source=(
	"$url/releases/download/v$pkgver/vscode-search-provider@jomik.org.shell-extension.zip"
	"https://raw.githubusercontent.com/Jomik/vscode-search-provider/v$pkgver/LICENSE"
)
md5sums=('a740df034ede1fcabc1bf59e5ce10d46'
         'b400106cc2bda3124008645a217c10bd')
sha1sums=('bfa3aaa23034396ab6f30c0e90669417248cfdd4'
          'f930f495d8cf7f1d067c192462132c1e5a62b8d5')
sha512sums=('079b1d07d7de94cc0eca1b1f04f6a50d30f8521ce8a89b722a5fac1aac64da7e4789ec9fd97443b17ba65367f7323cc7d52175b8552e9ab90455ddea0f267c68'
            'e0fc0bdebe6fcd1d086671a7d98331d52dccb7782bdabdc3a36166b5e5febc6ddfe822c8193282782eb7d5fe291c203fa90562fd640e2afc061de903f40151dc')

package() {
	local _uuid="vscode-search-provider@jomik.org"
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js prefs.xml schemas/gschemas.compiled schemas/*.xml
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
