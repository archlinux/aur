# Maintainer: Althorion <althorion@protonmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=xxhash
pkgname=python-${_pyname,,}
pkgver=1.4.1
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
source=("https://pypi.io/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('2e6c0bd69a540e15ff2222d6cb8da466')
sha256sums=('6b5af8c37ff12745ae77f28e695c0d3a3327932fd229824e49382377e940fdf1')

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
