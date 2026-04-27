# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=slipnet
pkgname=slipnet-bin
pkgver=2.5.3
pkgrel=1
pkgdesc="Android VPN client with DNS tunneling (DNSTT, NoizDNS & Slipstream), NaiveProxy, SSH, Tor, and DoH support — featuring a built-in DNS scanner. "
arch=('aarch64' 'x86_64')
url="https://github.com/anonvector/SlipNet"
license=('custom')
conflicts=('slipnet')
provides=('slipnet')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}linux-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums_aarch64=('f5d4bcbfef8332d24b7b54225d20ecf042f810464b599e137956daa173515293')
sha256sums_x86_64=('1eb6a66df7a9d15e2260dd28d28655a3d5cebced8504509062ab614097f27534')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
