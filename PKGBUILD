# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8
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
	"${url}/releases/download/${pkgver}/${_pkgname}-linux-${CARCH}.zip"
	"LICENSE::https://raw.githubusercontent.com/emoeem/voicefox/refs/tags/${pkgver}/LICENSE"
)
sha512sums=('fbec2d87c93a8040a663e5b1d174e1fda471b6bd21511ee570b9787d96890e039f97f149b0c9c21c45ffea8dbe84da82defdedea3c72322f8c8c785632e26b5f'
            'b083d9572511a96dbb86ffcf02e8ff843a5268062fffb65ca17b277a859b9648aaa6c3eadc72941a5f83e23e6fb6829c932a9f25c91260b673817af663ba830b')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
