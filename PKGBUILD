# Maintainer: Ivan Ivanov
pkgname=gol
pkgver=1.0
pkgrel=1
pkgdesc="Terminal-based Conway's Game of Life implementation"
arch=('x86_64' 'i686')
url="https://github.com/RansomDark/gol"
license=('MIT')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RansomDark/gol/archive/v$pkgver.tar.gz")
sha256sums=('aec2e131d0ba6fef617f1211511ff5b9')

build() {
  cd "$srcdir/gol-$pkgver"
  make
}

package() {
  cd "$srcdir/gol-$pkgver"
  install -Dm755 gol "$pkgdir/usr/bin/gol"
  install -d "$pkgdir/usr/share/gol/presets"
  cp -r presets/* "$pkgdir/usr/share/gol/presets/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
