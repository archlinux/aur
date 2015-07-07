# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: jan.scevlik <jan.scevlik@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python2-xlutils
pkgver=1.7.1
pkgrel=1
pkgdesc="Utilities for working with Excel files"
arch=('any')
url="http://www.python-excel.org/"
license=('MIT')
depends=('python2-xlrd' 'python2-xlwt')
makedepends=('python2-setuptools')
optdepends=('python2-errorhandler: needed for ErrorFilter support')
source=("http://pypi.python.org/packages/source/x/xlutils/xlutils-${pkgver}.tar.gz")
md5sums=('6247ccda7d8f864b815525e94da30977')

build() {
  cd "$srcdir"/xlutils-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/xlutils-$pkgver

  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -Dm644 xlutils/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

