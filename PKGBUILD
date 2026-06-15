# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=jumpapp-ng
pkgver=1.2.1
pkgrel=1
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('any')
url="https://github.com/musqz/jumpapp"
license=('MIT')
depends=('bash' 'wmctrl' 'xdotool' 'xorg-xprop')
provides=('jumpapp')
conflicts=('jumpapp' 'jumpapp-git')
source=("jumpapp-ng-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc88c52f6ee267e33734762df830ea781d4b87a868ca769c09b8a751c6fe78df')

package() {
  cd "jumpapp-$pkgver"
  install -Dm755 jumpapp -t "$pkgdir/usr/bin/"
  install -Dm755 jumpappify-desktop-entry -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
