# Maintainer:       zzjzxq33 <wojiushixxx at 126 dot com>
# Co-Maintainer:    Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bbg
pkgver=20220315
pkgrel=2
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/baiyang-lzy/bbg"
license=('Unlicense')
depends=('electron16')
conflicts=("${pkgname}-git")
source=(
	'bbg.sh'
	'icon.png'
	'bbg.desktop'
	"app-${pkgver}.asar"::"${url}/releases/download/${pkgver}/app.asar"
)
sha256sums=(
	'ef39a1c67ffe2228d8bb51256a5a666d8ecbbfbc935c1f515a6c087ba5fbe924'
	'b2055c02386eacb33fff9f53b2c1bf099d49e4c63d016704a220e9108ded262f'
	'f503d93639c1f4d4e050eceb11adf64d369908e5941cfdbda3af30b2f3c73d96'
	'ce9c8bdd36e174e4fb5fcd85daf0c8bc7910e93300979688e4e47b72c6b2bb50'
)

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "bbg.sh"             "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
	install -Dm644 "bbg.desktop"        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "icon.png"           "${pkgdir}/usr/share/icons/${pkgname}.png"

	# install bbgvertype: https://github.com/baiyang-lzy/bbg/blob/f3d61ce4d79680329bad4cb014c909fb86037f38/App/start.js
	echo "aur-bbg-zzjzxq33-misaka13514" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bbg/bbgvertype"
}
