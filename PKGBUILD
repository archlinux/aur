# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0
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
)
optdepends=(
	"kitty: support for displaying cover image in tmux"
	"nodejs>=23.5.0: support for custom JS music source"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-git")
source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('473e1bfe7d02776136349fb094ebc74c4b4f30a9cda6721e900dc75134a9a791e09fb1ea988eae4706bce7bdb2e69af9ab8b70214be66d129ccff611c5424595'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
