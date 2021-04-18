# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=endless-sky-high-dpi
pkgver=0.9.13
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('15821b67f3fb0e4e7924f0dce3aa435c0fef4cbedf6a42705a8a3925cccf765fbbde093deeeb06d6d9e3c6e72c46e2eca5cd69388a587735b96b457fff45a930')

package() {
  cd "$pkgname-$pkgver"

  # create plugin directory
  install -d "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname"

  # install plugin
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" copyright
}
