pkgname=go-musicfox-bin
pkgver=3.2.2
pkgrel=3
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('musicfox' 'go-musicfox')
depends=('flac' 'alsa-lib')
source=(
	"${url}/releases/download/v${pkgver}/go-musicfox_${pkgver}_linux_amd64.zip"
	"LICENSE"
)

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/usr/lib"
	# fix libFLAC.so.8 error
	ln -s /usr/lib/libFLAC.so "${pkgdir}/usr/lib/libFLAC.so.8"
	install -Dm755 "${srcdir}/go-musicfox_${pkgver}_linux_amd64/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('6971bfb234ee4e3bf75b3f98c7d37d2a855221ea9f747cf1232a923af903710d'
            '20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
