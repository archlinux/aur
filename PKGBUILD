# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=jumpapp-ng
pkgver=1.3.1
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
sha256sums=('915af00e688bb2d054af5c3a2d9ba018cf226d0caae52e719bfcb586767403b9')

package() {
  cd "jumpapp-$pkgver"
  install -Dm755 jumpapp -t "$pkgdir/usr/bin/"
  install -Dm755 jumpappify-desktop-entry -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
