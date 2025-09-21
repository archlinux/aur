# Maintainer: goatvisuals <goat@iusevimbtw.com>

pkgname=auto-big-picture
pkgver=1.0
pkgrel=1
pkgdesc="Auto launch Steam Big Picture on controller connect (Bluetooth/USB)"
arch=('any')
url="https://github.com/goatvisuals/Auto-Big-Picture"
license=('MIT')
depends=('python')
optdepends=('bluez-utils: for Bluetooth mode')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92848c60a1605cf23937bde4c24c7b1c27c2cf650877e3bb1e7a452a71ffb0e7')

package() {
  cd "Auto-Big-Picture-$pkgver"
  install -Dm755 install.sh "$pkgdir/usr/bin/auto-big-picture-setup"
  install -Dm755 uninstall.sh "$pkgdir/usr/bin/auto-big-picture-uninstall"
  install -Dm644 auto-big-picture.py.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.py.template"
  install -Dm644 auto-big-picture.service.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.service.template"
  install -Dm644 README.md "$pkgdir/usr/share/doc/auto-big-picture/README.md"
}
