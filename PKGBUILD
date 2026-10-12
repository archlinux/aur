# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=jumpapp-ng
pkgver=1.3.0
pkgrel=1
pkgdesc="A run-or-raise application switcher for X11 and Wayland (labwc)"
arch=('any')
url="https://github.com/musqz/jumpapp"
license=('MIT')
depends=('bash' 'wmctrl' 'xdotool' 'xorg-xprop')
optdepends=('wlrctl: Wayland (labwc) support' 'lswt: Wayland (labwc) support')
provides=('jumpapp')
conflicts=('jumpapp' 'jumpapp-git')
source=("jumpapp-ng-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e16269f1a81eb6fbb4ea331842d385df15718ea2b8366d5f79a45964cc0ea2c5')

package() {
  cd "jumpapp-$pkgver"
  install -Dm755 jumpapp -t "$pkgdir/usr/bin/"
  install -Dm755 jumpappify-desktop-entry -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
