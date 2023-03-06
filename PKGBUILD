pkgname=go-musicfox-bin
pkgver=3.7.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('musicfox' 'go-musicfox')
depends=('alsa-lib' 'flac1.3')
source=(
	"${url}/releases/download/v${pkgver}/go-musicfox_${pkgver}_linux_amd64.zip"
	"LICENSE"
)

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/go-musicfox_${pkgver}_linux_amd64/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('6a6c495b092529a0fa2e00437c925c6c23780e380d010f57cf8a324661b3b699'
            '20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
