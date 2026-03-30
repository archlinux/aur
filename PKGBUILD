# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=slipnet
pkgname=slipnet-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Android VPN client with DNS tunneling (DNSTT, NoizDNS & Slipstream), NaiveProxy, SSH, Tor, and DoH support — featuring a built-in DNS scanner. "
arch=('aarch64' 'x86_64')
url="https://github.com/anonvector/SlipNet"
license=('custom')
conflicts=('slipnet')
provides=('slipnet')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}linux-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums_aarch64=('2813e7f827ff54da793a0549bbd0e5922124ee364369e6966d67dec327fde74f')
sha256sums_x86_64=('447a98fa4bbdfa47cb05d5b067cef5c5276bb9a83dc6fa985e82f9f8582b734e')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
