# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9
pkgrel=1
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('3336d6c1995d7d3099746dd78e541bdbc863bca6d8e3d1ded5c5a6f1cf08ee84abc3e883e61c851eb772c081a2119d0a5e3d0207d7c08ea731e5c39563202aa2'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
