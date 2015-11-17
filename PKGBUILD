# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-dill
pkgver=0.2.4
pkgrel=1
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/d/dill/dill-$pkgver.tgz")
md5sums=('8e7d1ec5a0f150b536da4d0623c3931b')

build() {
  cd "$srcdir/dill-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/dill-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

