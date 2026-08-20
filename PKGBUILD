# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.7
pkgrel=1
epoch=1
_tag="${pkgver}"
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!debug)
depends=(
	"glibc"
	"hicolor-icon-theme"
	"libgcc"
	"openssl"
	"mpv"
)
optdepends=(
	"nodejs>=23.5.0: support for custom JS music source"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${_tag}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_tag}/LICENSE"
	"${_pkgname}-${pkgver}-512.png::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_tag}/icons/512.png"
	"${_pkgname}-${pkgver}-1024.png::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_tag}/icons/1024.png"
	"${_pkgname}-${pkgver}-desktop::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${_tag}/assets/voicefox.desktop"
)
sha512sums=('908fe8977b27fe34acc3b2dcad1a87c1522a2d036657b6bef6a8b3c3cbb07db87fe960dcebb235c2c44e53192e6fcd064bbb79e4cf8ad9ffe1dc84c29f2cb2cd'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814'
            '980a563b61ebd519a5346de26b67d6782830f6183ad2b4c42ac3e85d0ebd1b4341a1041976cb06c10d1eed346d9f4c009341753f560db63882a5df56e180471b'
            '4749d0f3d9cff9caec6c9dbd18f9ff571905e22d4669fb504e8c2b778dead770d2b5ddbbf0bdadc7b60ca9317f25579e97a016888f38c1b8ade6a476e09a3e6e'
            '61d35b8f99a6fe902dce9c46f6a6a793b826a61f7be5affd8d78ba255c4be90ab57e566296bc6ddda9109d7ac526ae4c726132e82ed9d7259b4e9caf38e3a55d')

package() {
	install -Dm755 "${_pkgname}" \
	    "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_pkgname}-${pkgver}-512.png" \
		"${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "${_pkgname}-${pkgver}-1024.png" \
		"${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
	install -Dm644 "${_pkgname}-${pkgver}-desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
