# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=1.0.7
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
sha256sums_x86_64=('b5030fbd449dd89f22097f107c712ffe4f038d793791437318c491af61b1daa5')
sha256sums_aarch64=('7fcb44076d0554f2e61d5149686d4156cd370fa6634d598fec09ea1d82931ff2')
sha256sums_armv7h=('b8d8847aca7d8b795af3ff16143826a660a7bffed47622d42958bc94f3214ec0')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok-agent.service" "$pkgdir/usr/lib/systemd/user/zrok-agent.service"
}

# vim:set ts=2 sw=2 et:
