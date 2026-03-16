pkgname=flatbat
pkgver=1.8
pkgrel=1
pkgdesc="Minimalist GTK layer-shell system monitor overlay (CPU, RAM, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'python-gobject' 'python-yaml' 'gtk-layer-shell' 'python-cairo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasmckenna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a38544400eb0eb77278c2ca93267484bd393007571278c26bf85b6f3df0e5c2e')
pkgname=flatbat
pkgver=1.8
pkgrel=1
pkgdesc="Minimalist GTK layer-shell system monitor overlay (CPU, RAM, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'python-gobject' 'python-yaml' 'gtk-layer-shell' 'python-cairo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasmckenna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 flatbat.py "$pkgdir/usr/bin/flatbat"
  sed -i '1s|.*|#!/usr/bin/python3|' "$pkgdir/usr/bin/flatbat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.yaml "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"
}
