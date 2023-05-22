pkgname=python-pathlib2
pkgver=2.3.7.post1
pkgrel=1
pkgdesc='Backport of pathlib aiming to support the full stdlib Python API'
arch=('any')
url="https://github.com/jazzband/pathlib2"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pathlib2/pathlib2-$pkgver.tar.gz")
sha256sums=('9fe0edad898b83c0c3e199c842b27ed216645d2e177757b2dd67384d4113c641')

build() {
  cd "$srcdir/pathlib2-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pathlib2-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
