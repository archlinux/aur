# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok2-bin
pkgver=2.0.8
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
sha256sums_x86_64=('027cc46c8b652a82f87823cec45fbb5fc878455268857e69e22fbe9dca225f3a')
sha256sums_armv7h=('4e5ceed36fd3b742b855104df334fde61a42f6807dd4c36c4ea3ac6fa105a4bd')
#sha256sums_aarch64=('2c38069ee27c3c96f8d35cbe23e3a51457651229049edcd017bdbb485c9f1920')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$srcdir/zrok2-agent.service" "$pkgdir/usr/lib/systemd/user/zrok2-agent.service"
}

# vim:set ts=2 sw=2 et:
