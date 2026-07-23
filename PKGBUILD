# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7
pkgrel=1
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto)
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
provides=("voicefox")
conflicts=("voicefox" "voicefox-git")
source=(
	"${url}/releases/download/0.7/${_pkgname}-linux-${CARCH}.zip"
	"LICENSE::https://raw.githubusercontent.com/emoeem/${_pkgname}/refs/heads/main/LICENSE"
)
sha512sums=('eed0c69abe5de1f1f9322d20adfd5642c1a57b8258553ae9031f2495ff70c2b655f8ea456f8c2ff875e82295babae4735eca3881afd9193ff9c45753ec7a7a61'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
