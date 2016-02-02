# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=logging_tree
pkgname=python-$_pyname
pkgver=1.7
pkgrel=1
pkgdesc='Introspect and display the logger tree inside "logging"'
url="http://pypi.python.org/pypi/$_pyname/"
depends=('python')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('21d8a0408402022af416dee0e1101a67')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
