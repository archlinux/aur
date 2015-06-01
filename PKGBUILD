# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
pkgname=zbase32
pkgver=1.1.5
pkgrel=1
pkgdesc="alternate base32 encoder (not RFC 3548 compliant)"
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/zbase32'
license=('BSD')
depends=('python2')
makedepends=('setuptools' 'darcsver' 'setuptools_darcs')
source=( http://pypi.python.org/packages/source/z/zbase32/zbase32-$pkgver.tar.gz )
md5sums=('4dba0be4ac6d66968de8e5173f51d65d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
  python2 setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
