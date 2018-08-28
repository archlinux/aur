# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=endless-sky-high-dpi
pkgver=0.9.8
pkgrel=1
pkgdesc="High DPI sprites for Endless Sky"
arch=('any')
url="https://github.com/endless-sky/endless-sky-high-dpi"
license=('GPL3' 'custom:CC-BY-SA-3.0' 'custom:CC-BY-SA-4.0' 'custom:public domain')
depends=('endless-sky')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('534a51190e3b5388c29b09bab9fbef05691c6eb89260da83742e28897612c80f99d5c1205838c4d32fddab15d1f685cdeaddccf028381a77c2223a0a1c6b5dce')

package() {
  # create plugin directory
  mkdir -p "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"

  # install files & license(s)
  cd "$pkgname-$pkgver"
  cp -r * "$pkgdir/usr/share/games/endless-sky/plugins/$pkgname/"
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
