# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=endless-sky-high-dpi
pkgver=0.9.9
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('86b81a26fdbc76aeeb6ed01e5bbde7da3d13e0f915a46cbc94be980221506276f45e17122524fa008640b86b45a142b3383db1c7cd48bf10cbe5c72db611be2f')

package() {
  cd "$pkgname-$pkgver"

  # create plugin directory
  mkdir -p "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # install plugin
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # license
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
