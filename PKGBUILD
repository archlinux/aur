# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=fastapi
pkgname=python-fastapi
pkgver=0.49.0
pkgrel=1
pkgdesc="FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints."
arch=('any')
url="https://fastapi.tiangolo.com/"
license=('MIT')
depends=('python' 'python-setuptools' 'python-starlette' 'python-pydantic')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('bfc84fe686c29e42ef96b279e4664601')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
