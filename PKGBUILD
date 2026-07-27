# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=1.1
_pkgver=1,1
pkgrel=1
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
depends=(
	"glibc"
	"hicolor-icon-theme"
	"libgcc"
	"openssl"
	"mpv"
)
optdepends=(
	"kitty: support for displaying cover image in tmux"
	"nodejs>=23.5.0: support for custom JS music source"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${_pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_pkgver}/LICENSE"
	"${_pkgname}-${pkgver}-512.png::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_pkgver}/icons/1.png"
	"${_pkgname}-${pkgver}-desktop::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_pkgver}/assets/voicefox.desktop"
)
sha512sums=('662874cfa15cef689d0d09b3a6b6b5f7b91b008971eb77d4a1d263d65961618f2b6eb7791d8c0667770067c1f309686eb790d5cb1c3db909fa2643d797646f83'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814'
            'c83d0e8f73e22aa9752adac02a3c156f1cfd274b93808d3672cbcc467d9231e1e0590164bb5c5085d7bf702f36101286983b3919881a53f0ec741e208753422f'
            '61d35b8f99a6fe902dce9c46f6a6a793b826a61f7be5affd8d78ba255c4be90ab57e566296bc6ddda9109d7ac526ae4c726132e82ed9d7259b4e9caf38e3a55d')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_pkgname}-${pkgver}-512.png" \
		"${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "${_pkgname}-${pkgver}-desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
