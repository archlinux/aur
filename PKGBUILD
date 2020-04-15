# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=starlette
pkgname=python-starlette
pkgver=0.13.3
pkgrel=1
pkgdesc="Starlette is a lightweight ASGI framework/toolkit, which is ideal for building high performance asyncio services."
arch=('any')
url="https://www.starlette.io/"
license=('BSD')
depends=('python' 'python-setuptools')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('94b97ed36c2d478ab410600422cc19c9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
