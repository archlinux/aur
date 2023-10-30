# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=0.4.14
pkgrel=1
pkgdesc='An open source sharing solution built on OpenZiti'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/openziti/zrok'
license=('Apache')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-linux-armv7.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('0d8eab317854785e2c565925d1c55e650ec50c8c234500516e7b8538bf10bc7c')
sha256sums_aarch64=('64f5bfbcf9ebaf747dac435fc50ef092e10661f6403da1d1e2c6fcc4d6a1e98a')
sha256sums_armv7h=('539fd4e2264b592b48c8bd284f5a9da79b16de9f378e4c4e548a0241fdbcb97f')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
