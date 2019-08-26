# Maintainer: Althorion <althorion@protonmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=xxhash
pkgname=python-${_pyname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
source=("https://pypi.io/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('130a57385de144c8d196bbce32d44940')
sha256sums=('cb7a830d216e433518aeca389def4260940823308816358a5fc5d3beef682055')

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
