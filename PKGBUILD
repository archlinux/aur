# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-logging_tree
pkgver=1.6
pkgrel=1
pkgdesc='Introspect and display the logger tree inside "logging"'
arch=('any')
url='http://pypi.python.org/pypi/logging_tree/'
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/l/logging_tree/logging_tree-$pkgver.tar.gz")
md5sums=('33ef7eaa1533a50cf67ed1c49a48cfdd')

build() {
  cd "$srcdir/logging_tree-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/logging_tree-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

