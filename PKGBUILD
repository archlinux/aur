pkgname=flatbat
pkgver=1.6
pkgrel=1
pkgdesc="Minimalist tkinter system monitor overlay (CPU, RAM, GPU, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'tk')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomasmckenna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('721ccfcc02f021858e791656683b3c9c5d27bed5f5793e9c5fae3ef5aac53781')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
