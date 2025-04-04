# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=1.0.1
pkgrel=2
pkgdesc='An open source sharing solution built on OpenZiti'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/openziti/zrok'
license=('Apache')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

install="${pkgname}.install"

source=('zrok-agent.service')
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-linux-armv7.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")

sha256sums=('e510465ca8b29a514ef67f3d5bc41d613413a88781c17f88afdaa594fb4bfe7c')
sha256sums_x86_64=('98739bc0bf363ec1613a60806d43fbcc08cc2a72fa05dffb7e17643fbadf91d1')
sha256sums_aarch64=('caeac12769ad1a5c9111bec25c07de119fd4e9a62bf9b9404c000d81e543e998')
sha256sums_armv7h=('03d62127ee7082826edbdb90bddb902ead8f49b1893a3610cd5b810389f761fd')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok-agent.service" "$pkgdir/usr/lib/systemd/user/zrok-agent.service"
}

# vim:set ts=2 sw=2 et:
