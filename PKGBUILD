# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=python2-timelib
pkgver=0.2.4
pkgrel=2
pkgdesc="A library to parse english textual date descriptions"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/timelib"
license=(PHP custom)
depends=('python2')
source=("http://pypi.python.org/packages/source/t/timelib/timelib-$pkgver.zip")
md5sums=('400e316f81001ec0842fa9b2cef5ade9')

build() { 
  cd "$srcdir/timelib-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/timelib-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 README.rst \
    "$pkgdir/usr/share/licenses/$pkgname/README.rst"
}
