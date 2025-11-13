# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=1.1.10
pkgrel=2
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
sha256sums_x86_64=('9c3090180989ff52094e756fbe38a0e0c2df3c069337f971dd7ac136ad82a6d8')
sha256sums_aarch64=('d78ff79a1dd32b7ffe56c4ea33b15139bdeb0551f2abe02119afc21c43c596d7')
sha256sums_armv7h=('b3d71022777f7d9b7f6dea2bd94bb7837908dc79f097e891d1d5665b5ad8f382')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok-agent.service" "$pkgdir/usr/lib/systemd/user/zrok-agent.service"
}

# vim:set ts=2 sw=2 et:
