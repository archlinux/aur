# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=mullvad-socks5-proxy
pkgver=0.0.4
pkgrel=1
pkgdesc="SOCKS5 Proxy with WireGuard using Mullvad VPN"
url="https://github.com/dcelasun/mullvad-socks5-proxy"
arch=('any')
license=('Apache-2.0')
depends=('bash' 'socat' 'iproute2' 'python')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c3f42ab464da428af91eb80f8cdee626d6ad74e9a713ff4666e7447b9c267af')

package() {
    install -dm755 "${pkgdir}"/etc/mullvad-socks5-proxy
    install -dm755 "${pkgdir}"/usr/lib/systemd/system
    install -dm755 "${pkgdir}"/usr/bin
    install -dm755 "${pkgdir}"/usr/share/applications/licenses/${pkgname}

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}@.service
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/applications/licenses/${pkgname}/LICENSE
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}
