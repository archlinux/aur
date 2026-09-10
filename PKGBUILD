# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.37
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
sha512sums_x86_64=('93a575782c7837cec8c6532f89cd03b098e4bf836d0bf52e1e817902e1b781da4110ca0649528a3ac881ba4ac34b20f84eb83884bd3b654176b51a7d99ddcfe3')
sha512sums_aarch64=('2f62c06117a685eaf0f7485563cd967feef3759cb79de2dd719ad5f545bd13322d3a275203966ab4799c24eabca1b89453b90e88cf8df75a5bbc0d261a1f7018')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/solc"
}
