# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=corner
pkgname=python-$_pyname
pkgver=2.0.0
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-matplotlib')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('2c00271abef0c967660b3c2b41117f6e')

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
