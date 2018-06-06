# Maintainer: George C. Privon <accounts5 at privon dot com>

_pyname=corner
pkgname=python-$_pyname
pkgver=2.0.1
pkgrel=2
pkgdesc='Make some beautiful corner plots of samples'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-matplotlib' 'python-pytest' 'python-nose' 'python-pandas')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('148a401ebb1dff47897fe4a1389e8c77')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py test
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
