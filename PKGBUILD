# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=gino
pkgname=python-gino
pkgver=0.8.6
pkgrel=1
pkgdesc="GINO - GINO Is Not ORM - is a lightweight asynchronous ORM built on top of SQLAlchemy core for Python asyncio. Now (early 2020) GINO supports only one dialect asyncpg."
arch=('any')
url="https://python-gino.org/"
license=('BSD')
depends=('python' 'python-setuptools')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b35926d2b7de17ce8ee7c113ab0c2a15')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
