# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=0.4.19
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

sha256sums_x86_64=('5aa8aae25c166113023da9b126684bc9e12be22216469a327e0982df2567eab0')
sha256sums_aarch64=('42b0bc0c7b844dc2a02b977f66381667a644f1ac73204c171bb62060f7d181c2')
sha256sums_armv7h=('b2963005a4df1896db3d4d1ffe5f718feeaa7dc6a6a36b74fe027a19e7d9cf2d')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
