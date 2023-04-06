# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-first
pkgver=2.0.2
pkgrel=6
pkgdesc="Return the first true value of an iterable"
url="https://github.com/hynek/first"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hynek/first/archive/$pkgver.tar.gz")
sha512sums=('4d82d4b3ddae8a47ab423b1ab5c281738f0290e428be5ce66ce50ed8110ced656c57a7164a3ca734763db117be437fe32d9d9d9a7cd196296b2ac1c4dd14d675')

build() {
  cd first-$pkgver
  python setup.py build
}

check() {
  cd first-$pkgver
  python setup.py pytest
}

package() {
  cd first-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
