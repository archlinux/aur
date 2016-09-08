# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=xxhash
pkgname=python-${_pyname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python')
license=('BSD')
source=("https://pypi.io/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('bcdbd843eecfda715b089c0aa387b4e7')


build() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py test
}

package() {
  cd $srcdir/$_pyname-${_pyver:-$pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
