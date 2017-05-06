# Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=toss
pkgver=1.0
pkgrel=1
pkgdesc="Dead simple LAN file transfers from the command line"
arch=("x86_64")
url="https://github.com/zerotier/toss"
license=("MIT")
source=("https://github.com/zerotier/toss/archive/$pkgver.tar.gz")
sha256sums=('547299da1b81c4b9cf8f135edb12555e3dea24bb10d4a73aa5b91299e73bea42')

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || return 1

  install -Dm755 toss "$pkgdir/usr/bin/toss"
  install -Dm755 catch "$pkgdir/usr/bin/catch"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/toss"
}

# vim:set ts=2 sw=2 et:
