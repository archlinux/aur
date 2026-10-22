# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.38
pkgrel=1
pkgdesc='Smart contract programming language'
arch=('x86_64' 'aarch64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("solc-static-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
source_aarch64=("solc-static-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux-arm")
sha512sums_x86_64=('1cfcd567bb2ba85fb8e8cbb617c7d8f06298fd684b2ddc2ef9bbdbed8ffe74013445cec2dedfa002a90e4b18af0feb5fd716f03859f6188cf4fed0610e79fe2c')
sha512sums_aarch64=('0bde13853fbbbec0e71f5874b23ff165564262f5e73dbbcb8b7cc057e9ac2117e4c902f6cef89a169c94dfdef071eb23ef88b46b44880483cb26c2f6ae84f43b')

package() {
  install -Dm755 "solc-static-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/solc"
}
