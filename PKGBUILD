# Maintainer: Serge K <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.36
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64' 'aarch64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux-arm")
sha512sums_x86_64=('f5aed5c36c0ed0db433490419d3150973f179fd511d96a75920b796a0dda947259d037ff02d1f86d3951efa09f0837f4ac42e5e8dc5694ea0ceab7cfab34655b')
sha512sums_aarch64=('c13d354f3c58d37170136ff8f46f7895f54706e86b21f0924917a3c3612d84fc3ba6524d9c8a4337dd406eb16efdbd32b4f9267c4f078dc847d338e1df34006c')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/solc"
}
