# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=aiocontextvars
pkgname=python-aiocontextvars
pkgver=0.2.2
pkgrel=2
pkgdesc="This module provides APIs to manage, store, and access context-local state. The ContextVar class is used to declare and work with Context Variables."
arch=('any')
url="https://python-gino.org/"
license=('BSD')
depends=('python' 'python-setuptools' 'python-asyncpg' 'python-sqlalchemy')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('28e8e00dcc35f3b7964d1f5b30fde069')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
