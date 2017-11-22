# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=python-milksnake
pkgver=0.1.1
pkgrel=1
pkgdesc='Python library that extends setuptools for binary extensions'
arch=('any')
url=https://github.com/getsentry/milksnake
license=('Apache')
depends=('python-cffi')
makedepends=('python-setuptools')
source=("milksnake-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0703e5eee8d397bf37b248d46a4976019968d51db923a8b841c06bfbdf85d08325e99d800f206701b6a5610299e25b2a4e56e6b67730a0ce6349c785a9f666e2')

build() {
  cd milksnake-$pkgver
  python setup.py build
}

package() {
  cd milksnake-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
