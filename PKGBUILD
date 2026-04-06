# Maintainer: 0x90shell
pkgname=jstimeout-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Auto-disconnect idle Bluetooth gamepads after a configurable timeout'
arch=('x86_64')
url='https://github.com/0x90shell/jstimeout'
license=('MIT')
depends=('bluez-utils')
provides=('jstimeout')
conflicts=('jstimeout' 'jstimeout-git')
install=jstimeout-bin.install
source=("jstimeout-${pkgver}::${url}/releases/download/v${pkgver}/jstimeout"
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "jstimeout-${pkgver}" "$pkgdir/usr/bin/jstimeout"

  cd "jstimeout-${pkgver}"
  install -Dm644 .jstimeout.devices "$pkgdir/usr/share/jstimeout/devices.example"
  install -Dm644 jstimeout.service "$pkgdir/usr/share/jstimeout/jstimeout.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/jstimeout/README.md"
}
