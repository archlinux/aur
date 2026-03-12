pkgname=flatbat
pkgver=1.7
pkgrel=1
pkgdesc="Minimalist GTK layer-shell system monitor overlay (CPU, RAM, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'python-gobject' 'python-yaml' 'gtk-layer-shell')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasmckenna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3228af4e189275956c4615aab662bf1b27780650c66e3bed20016005083eb3a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 flatbat.py "$pkgdir/usr/bin/flatbat"
  sed -i '1s|.*|#!/usr/bin/python3|' "$pkgdir/usr/bin/flatbat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
