# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=('python2-fasteners')
pkgver=0.12.0
pkgrel=1
pkgdesc="A python package that provides useful locks."
arch=('any')
url="https://pypi.python.org/pypi/fasteners"
license=('Apache')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/f/fasteners/fasteners-$pkgver.tar.gz)
sha256sums=('300d9d605900d643f7778a177e022b4356877237bae9a8f8ebdaef8585d518bb')

build() {
  cd "$srcdir/fasteners-$pkgver"
  python2 setup.py build
}

package_python2-fasteners() {
  depends=('python2-six')

  cd "$srcdir/fasteners-$pkgver"
  python2 setup.py install --root=${pkgdir}
}
