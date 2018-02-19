# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=python-milksnake
pkgver=0.1.2
pkgrel=1
pkgdesc='Python library that extends setuptools for binary extensions'
arch=('any')
url=https://github.com/getsentry/milksnake
license=('Apache')
depends=('python-cffi')
makedepends=('python-setuptools')
source=("milksnake-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7b4f9f86861856f2440cf26aa7de8608c358fad4b63aec61472f626d0119e42e1cf7e4aaea0a7cb28a2528a7b8452c946f4c5c66ed0c5c59f58b6a49c14d6f65')

build() {
  cd milksnake-$pkgver
  python setup.py build
}

package() {
  cd milksnake-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
