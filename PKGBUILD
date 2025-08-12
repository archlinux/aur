# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='An open source sharing solution built on OpenZiti'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/openziti/zrok'
license=('Apache')
options=(!debug)
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

install="${pkgname}.install"

source=('zrok-agent.service')
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-linux-armv7.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")

sha256sums=('e510465ca8b29a514ef67f3d5bc41d613413a88781c17f88afdaa594fb4bfe7c')
sha256sums_x86_64=('a88a26b6dd85e476028219da68ed4198b68de5b0b97ed5834207aa75ae89321f')
sha256sums_aarch64=('aa138dc8b03f36105ab25014725562ef7d565ba2f4e9c999b2ae31b0977dd781')
sha256sums_armv7h=('3b9c333fa9169318df20737d4aa87c28f878ce123a74bfbad2be8eb5e998f75a')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok-agent.service" "$pkgdir/usr/lib/systemd/user/zrok-agent.service"
}

# vim:set ts=2 sw=2 et:
