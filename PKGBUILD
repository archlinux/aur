# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok2-bin
pkgver=2.0.9
pkgrel=1
pkgdesc='An open source sharing solution built on OpenZiti'
#arch=('x86_64' 'aarch64' 'armv7h')
arch=('x86_64' 'armv7h')
url='https://github.com/openziti/zrok'
license=('Apache')
options=(!debug)
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

install="${pkgname}.install"

source=('zrok2-agent.service')
#source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("zrok_${pkgver}-linux-armv7.tar.gz::${url}/releases/download/v${pkgver}/zrok_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("zrok_${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/zrok_${pkgver}_linux_amd64.tar.gz")

sha256sums=('ce6cc1096b309f7599d0e5647507dfd8ab5416b82e6feb959395fad9d8e566fc')
sha256sums_x86_64=('cce814e1f0036ea9bd6fc58363bd2b52468db903781d44defcf755349fca333f')
sha256sums_armv7h=('3b245dd2ce8813742620f0a816a48a098995dd530e922eefd92dc41aa68b0fce')
#sha256sums_aarch64=('2c38069ee27c3c96f8d35cbe23e3a51457651229049edcd017bdbb485c9f1920')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok2-agent.service" "$pkgdir/usr/lib/systemd/user/zrok2-agent.service"
}

# vim:set ts=2 sw=2 et:
