# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pythonqwt
pkgver=0.5.5
pkgrel=1
pkgdesc="Qt plotting widgets for Python (pure Python reimplementation of Qwt C++ library)"
arch=('any')
url="http://pythonhosted.org/PythonQwt/"
license=('custom') # mixed LGPL and MIT
depends=('python2-numpy')
optdepends=(
  'python2-pyqt4: for Qt4 support'
  'python2-pyqt5: for Qt5 support'
  'spyder: for test launcher'
)
makedepends=('python2-setuptools')
options=(!emptydirs)

source=("https://github.com/PierreRaybaut/PythonQwt/archive/v${pkgver}.tar.gz")
md5sums=('bc030741a7acc9c0921554ac06ba593a')

build() {
  cd "$srcdir/PythonQwt-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/PythonQwt-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

