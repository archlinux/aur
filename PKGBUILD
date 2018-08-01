# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt
pkgver=0.38
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("pyt-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('bd997a65cc52acc8fed079e7e3ccb98efdb254717f6dab08fd55af17226e4e4f836db68dfcf6e5efbfc568e71c3f511a622bd3e16d6afa5fe5dc07328f9fa5bd')

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
