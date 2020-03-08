# Maintainer: Tony Benoy <me@tonybenoy.com>

_pkgname=typer
pkgname=python-typer
pkgver=0.0.9
pkgrel=1
pkgdesc="Typer is library to build CLI applications that users will love using and developers will love creating. Based on Python 3.6+ type hints."
arch=('any')
url="https://typer.tiangolo.com/"
license=('MIT')
depends=('python' 'python-setuptools' 'python-click')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d6adbf44efba87872b21421c8daef490')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
