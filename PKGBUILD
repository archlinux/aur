# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=endless-sky-high-dpi
pkgver=0.9.12
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5db9c75c0261d36bb47c83dd091f5ab8c3819776c2ad7999415cdee21a975af2d4e77ef4e734b60e5a67eb0b9b4a5cee504bbefa2993c1bbf996fe89f5b916ba')

package() {
  cd "$pkgname-$pkgver"

  # create plugin directory
  mkdir -p "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # install plugin
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # license
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
