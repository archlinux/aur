# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-jsonpickle
pkgver=0.6.1
pkgrel=1
pkgdesc="a library for the two-way conversion of complex Python objects and JSON"
arch=('any')
url="http://jsonpickle.github.com/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')

source=("http://pypi.python.org/packages/source/j/jsonpickle/jsonpickle-$pkgver.tar.gz")
md5sums=('13684df11d9bc768b05146abcc947853')

build() {
  cd "jsonpickle-$pkgver"

  python2 setup.py build
}

package() {
  cd "jsonpickle-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

