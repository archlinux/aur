# Maintainer: meanlint <meanlint@outlook.com>
pkgname=shadowquic-bin
pkgver=0.2.2
pkgrel=2
pkgdesc="A 0-RTT QUIC Proxy with SNI camouflage"
arch=('x86_64' 'aarch64')
url="https://github.com/spongebob888/shadowquic"
license=('MIT')
provides=('shadowquic')
backup=('etc/shadowquic/config.yaml')
source_x86_64=("shadowquic::${url}/releases/download/v${pkgver}/shadowquic-x86_64-linux")
source_aarch64=("shadowquic::${url}/releases/download/v${pkgver}/shadowquic-aarch64-linux")
source=("shadowquic.service"
	"shadowquic@.service"
        "config.yaml")
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/shadowquic" "${pkgdir}/usr/bin/shadowquic"
    install -Dm644 "${srcdir}/shadowquic.service" "${pkgdir}/usr/lib/systemd/system/shadowquic.service"
    install -Dm644 "${srcdir}/shadowquic@.service" "${pkgdir}/usr/lib/systemd/system/shadowquic@.service"
    install -Dm644 "${srcdir}/config.yaml" "${pkgdir}/etc/shadowquic/config.yaml"
}
