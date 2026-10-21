# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=jumpapp-ng
pkgver=1.3.0
pkgrel=2
pkgdesc="A run-or-raise application switcher for X11 and Wayland (labwc)"
arch=('any')
url="https://codeberg.org/linux-bird/jumpapp"
license=('MIT')
depends=('bash' 'wmctrl' 'xdotool' 'xorg-xprop')
optdepends=('wlrctl: Wayland (labwc) support' 'lswt: Wayland (labwc) support')
provides=('jumpapp')
conflicts=('jumpapp' 'jumpapp-git')
source=("jumpapp-ng-$pkgver-codeberg.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2b32848c9aa679ee5d5d868597ce8e94dcebec67759f5562274cdb13e5826cc')

package() {
  cd "jumpapp"
  install -Dm755 jumpapp -t "$pkgdir/usr/bin/"
  install -Dm755 jumpappify-desktop-entry -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
