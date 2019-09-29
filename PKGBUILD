# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=endless-sky-high-dpi
pkgver=0.9.10
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e148c395d48d1591441d71557692c22b4bee49cd5ed96790506bec8dfb9d5c82335a6a6711cf2be410dd7ed0aed67703a13bafd0245fc68add9c69684290ccc1')

package() {
  cd "$pkgname-$pkgver"

  # create plugin directory
  mkdir -p "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # install plugin
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # license
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
