# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-cligj
_pyname=cligj
pkgver=0.4.0
pkgrel=2
pkgdesc="Click params for command line interfaces to GeoJSON"
arch=('any')
url="https://github.com/mapbox/cligj"
license=('BSD')
depends=('python' 'python-click' 'python-pytest-cov')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/c/$_pyname/$_pyname-$pkgver.tar.gz")

check() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py test
}

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

sha256sums=('12ad07994f5c1173b06087ffbaacec52f9ebe4687926e5aacfc22b6b0c8b3f54')
