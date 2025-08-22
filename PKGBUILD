pkgname=flatbat
pkgver=1.1
pkgrel=1
pkgdesc="Minimalist tkinter system monitor overlay (CPU, RAM, GPU, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'tk')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasmckenna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eebb11854ecb07edfa429ad3f2a70583824d9262fc9c2840524cdbf2d45a6688')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
