# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=aiocontextvars
pkgname=python-aiocontextvars
pkgver=0.2.2
pkgrel=1
pkgdesc="GINO - GINO Is Not ORM - is a lightweight asynchronous ORM built on top of SQLAlchemy core for Python asyncio. Now (early 2020) GINO supports only one dialect asyncpg."
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
