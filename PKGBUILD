# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=mullvad-socks5-proxy
pkgver=0.0.1
pkgrel=2
pkgdesc="SOCKS5 Proxy with WireGuard using Mullvad VPN"
url="https://github.com/dcelasun/mullvad-socks5-proxy"
arch=('any')
license=('Apache-2.0')
depends=('bash' 'socat' 'iproute2' 'python')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0df78b440a639ad36b59121df0e20100e0f27555cbef83c89f99b8dca6a8471f')

package() {
    install -dm755 "${pkgdir}"/etc/mullvad-socks5-proxy
    install -dm755 "${pkgdir}"/usr/lib/systemd/system
    install -dm755 "${pkgdir}"/usr/bin
    install -dm755 "${pkgdir}"/usr/share/applications/licenses/${pkgname}

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}@.service
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/applications/licenses/${pkgname}/LICENSE
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}
