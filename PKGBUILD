# Maintainer: goatvisuals <goat@iusevimbtw.com>

pkgname=auto-big-picture
pkgver=1.2
pkgrel=1
pkgdesc="Auto launch Steam Big Picture on controller connect (Bluetooth/USB)"
arch=('any')
url="https://github.com/goatvisuals/Auto-Big-Picture"
license=('MIT')
depends=('python')
optdepends=('bluez-utils: for Bluetooth mode')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('812868689c2b4d193812bf88b9fa64938d0fce1cfcd725d453b2b34d587d319e')

package() {
  cd "Auto-Big-Picture-$pkgver"
  install -Dm755 install.sh "$pkgdir/usr/bin/auto-big-picture-setup"
  install -Dm755 uninstall.sh "$pkgdir/usr/bin/auto-big-picture-uninstall"
  install -Dm644 auto-big-picture.py.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.py.template"
  install -Dm644 auto-big-picture.service.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.service.template"
  install -Dm644 README.md "$pkgdir/usr/share/doc/auto-big-picture/README.md"
}
