# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=jumpapp-ng
pkgver=1.2.2
pkgrel=1
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('any')
url="https://github.com/musqz/jumpapp"
license=('MIT')
depends=('bash' 'wmctrl' 'xdotool' 'xorg-xprop')
provides=('jumpapp')
conflicts=('jumpapp' 'jumpapp-git')
source=("jumpapp-ng-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2eb56a203f00f2536be533355797ec1cc4ff964888c3d4aad450e10ee983107')

package() {
  cd "jumpapp-$pkgver"
  install -Dm755 jumpapp -t "$pkgdir/usr/bin/"
  install -Dm755 jumpappify-desktop-entry -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
