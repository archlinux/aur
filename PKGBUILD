# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_name=milksnake
pkgname=python-milksnake
pkgver=0.1.3
pkgrel=1
pkgdesc='Python library that extends setuptools for binary extensions'
arch=('any')
url=https://github.com/getsentry/milksnake
license=('Apache')
depends=('python-cffi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha512sums=('6850ccbcd8676ab95e76e3503eff0eec6f34dc6a92a6cf4e97eceff34f6815790b5ae035a719b2c82432759fe7fd80315e1b78abd762fcd896c69ed8e6d5f6b8')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
