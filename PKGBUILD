# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7
pkgrel=4
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
	"${url}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/f814e545f327d28db8d71832648330b9f97d3020/LICENSE"
)
sha512sums=('eed0c69abe5de1f1f9322d20adfd5642c1a57b8258553ae9031f2495ff70c2b655f8ea456f8c2ff875e82295babae4735eca3881afd9193ff9c45753ec7a7a61'
            'b083d9572511a96dbb86ffcf02e8ff843a5268062fffb65ca17b277a859b9648aaa6c3eadc72941a5f83e23e6fb6829c932a9f25c91260b673817af663ba830b')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
