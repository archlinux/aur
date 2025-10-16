# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=1.1.9
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
sha256sums_x86_64=('807a098562e2a699370b8f256152061ae26bb61ef45e8140895d100b795ebfce')
sha256sums_aarch64=('929379e950400b67fc46e1b34f6acbea5e99ba100c9765fe8ee54c438b920d59')
sha256sums_armv7h=('0842135051fd78fe239a5f6cde03bea109c07133283c3eb71cd9bd4b3b1fdc3c')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok-agent.service" "$pkgdir/usr/lib/systemd/user/zrok-agent.service"
}

# vim:set ts=2 sw=2 et:
