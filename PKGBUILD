# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.39
pkgrel=1
pkgdesc='Smart contract programming language'
arch=('x86_64' 'aarch64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("solc-static-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
source_aarch64=("solc-static-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux-arm")
sha512sums_x86_64=('9d435f2b141f6b69e0662795e71b350d264f3b47a9938ea60bef090ea5fd0226732a8cfa94d38fe22206baf1c2ce0d85af6caa8f38f43400c51ead6665d07eff')
sha512sums_aarch64=('9a10e035dfb5e467cf73fce92064a03769b5fb459178841dfdb4b8c0fa72c3f78ff785f0796fbc70cc9cfc031ba4b45bf2bc992c7922f699a9d2910427c84367')

package() {
  install -Dm755 "solc-static-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/solc"
}
