# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt
pkgver=0.40
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("pyt-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4c2caee72fa6b1d768e6e7062fca54a6cd0f2b7dbd33c9908669d732928afe712e92085805b4b52ce28535cc2ace11f7293cf7544340f42a271b88c192c2da93')

build() {
  cd pyt-$pkgver
  python setup.py build
}

check() {
  cd pyt-$pkgver
  python -m tests
}

package() {
  cd pyt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
