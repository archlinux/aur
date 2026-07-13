# Maintainer: Alexander Golov <lam3r0us@gmail.com>
pkgname=vpnbook-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to automatically fetch VPNBook configs, credentials and connect via OpenVPN"
arch=('any')
url="https://github.com/lamerous/vpnbook-cli"
license=('MIT')
depends=('python' 'python-httpx' 'python-beautifulsoup4' 'openvpn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a4e6776f26d90791004d20f86aed9ed5f2f25ccc01b74eb9e722c83a800793a2')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "vpnbook-cli.py" "${pkgdir}/usr/bin/vpnbook-cli"
    install -dm750 "${pkgdir}/etc/openvpn/client"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
