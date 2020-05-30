# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-ioisis')
pkgver=0.4.0
pkgrel=1
pkgdesc="I/O tools for converting ISIS data in Python"
arch=('any')
url='https://github.com/scieloorg/ioisis'
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-flake8')
depends=('python-click' 'python-construct' 'python-jpype1' 'python-ujson')
options=(!emptydirs)
sha256sums=('8f3b63234db58f1eef4aab330bfedfdef50ee9cf79b0fbde621e883301584638')
source=("ioisis-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

check() {
  cd "$srcdir/ioisis-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/ioisis-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
