# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-dill
pkgver=0.2.1
pkgrel=1
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/d/dill/dill-$pkgver.tgz")
md5sums=('66f4d8fff8724568bde03e421bf520bb')

build() {
  cd "$srcdir/dill-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/dill-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

