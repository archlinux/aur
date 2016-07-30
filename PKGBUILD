# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: jan.scevlik <jan.scevlik@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python2-xlutils
pkgver=2.0.0
pkgrel=1
pkgdesc="Utilities for working with Excel files"
arch=('any')
url="http://www.python-excel.org/"
license=('MIT')
depends=('python2-xlrd' 'python2-xlwt')
makedepends=('python2-setuptools')
optdepends=('python2-errorhandler: needed for ErrorFilter support')
source=("https://github.com/python-excel/xlutils/archive/${pkgver}.tar.gz")
md5sums=('6e696e3ad63bd1ebb1a7e9694723936b')

build() {
  cd "$srcdir"/xlutils-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/xlutils-$pkgver

  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -Dm644 xlutils/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

