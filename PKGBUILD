pkgname=python-technical
pkgver=1.3.0
pkgrel=2
pkgdesc="This is a collection of technical indicators collected or developed for Freqtrade as well as utilities such as timeframe resampling."
url="https://github.com/freqtrade/technical"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
depends=('python-arrow' 'python-pandas' 'python-ta-lib')

source=(https://github.com/freqtrade/technical/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8604750f1aced810c320a0a844f91511ae807bce8701d1599afedebef38b4aaa')


build() {
  cd "$srcdir/technical-$pkgver"
  python setup.py build 
}


package() {
  cd "$srcdir/technical-$pkgver"
  rm -rf tests
  python setup.py install -O1 --skip-build --root="$pkgdir"
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 
}
