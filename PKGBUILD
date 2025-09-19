# Maintainer: goatvisuals <goat@iusevimbtw.com>

pkgname=auto-big-picture-git
pkgver=0
pkgrel=1
pkgdesc="Auto launch Steam Big Picture on controller connect (Bluetooth/USB)"
arch=('any')
url="https://github.com/goatvisuals/Auto-Big-Picture"
license=('MIT')
depends=('python')
optdepends=('bluez-utils: for Bluetooth mode')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Auto-Big-Picture"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Auto-Big-Picture"
  install -Dm755 install.sh "$pkgdir/usr/bin/auto-big-picture-setup"
  install -Dm755 uninstall.sh "$pkgdir/usr/bin/auto-big-picture-uninstall"
  install -Dm644 auto-big-picture.py.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.py.template"
  install -Dm644 auto-big-picture.service.template "$pkgdir/usr/share/auto-big-picture/auto-big-picture.service.template"
  install -Dm644 README.md "$pkgdir/usr/share/doc/auto-big-picture/README.md"
}
