# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=0.4.38
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

sha256sums_x86_64=('0df85fa56bbd045f72dea9c7cef6fd7fe898a276fa601ed59a7735aede284a9a')
sha256sums_aarch64=('88a1e06e60de3eb1770970f5893f21518aaa9bdd2cf1a0ea200ad751dac5d8c4')
sha256sums_armv7h=('b6a20e40ae7157f16071576816233aefc8a84914a945deb2195c69090794608b')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
