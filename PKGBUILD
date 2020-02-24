# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=endless-sky-high-dpi
pkgver=0.9.11
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5b4311add1b3a4a48439bfa59653e5866b9915f22ba8fc16fde8ac0947d6065a0a56b54d3e28680af55c33797c1c5a4cf2a213aece4efb266f9835ffa3e3dba6')

package() {
  cd "$pkgname-$pkgver"

  # create plugin directory
  mkdir -p "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # install plugin
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # license
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
