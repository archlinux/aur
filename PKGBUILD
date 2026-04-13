# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=slipnet
pkgname=slipnet-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Android VPN client with DNS tunneling (DNSTT, NoizDNS & Slipstream), NaiveProxy, SSH, Tor, and DoH support — featuring a built-in DNS scanner. "
arch=('aarch64' 'x86_64')
url="https://github.com/anonvector/SlipNet"
license=('custom')
conflicts=('slipnet')
provides=('slipnet')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}linux-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums_aarch64=('6b1e3c3ef141199bc91386ffd6a6fb94c5df566186883fc1859b0c88c40c9d49')
sha256sums_x86_64=('89247aad68a0cfb89772b6e634fa70b7fdec5695f0c497540364165afbf2a02f')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
