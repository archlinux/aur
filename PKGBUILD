# Maintainer: Althorion <althorion@protonmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=xxhash
pkgname=python-${_pyname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
source=("https://pypi.io/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz")
md5sums=('80461eff10ac62214fa788a6045aab43')
sha256sums=('82cdc67b41da904aa2921107e9877814079d9b067a99f19852b5d85e8a40555d')

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
