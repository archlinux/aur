# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=corner
pkgname=python-$_pyname
pkgver=1.0.2
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-matplotlib')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('e2f4f62fe836dd4866c3bb65480832e6')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
