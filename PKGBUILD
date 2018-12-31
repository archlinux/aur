# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pyt
pkgver=0.42
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-setuptools')
source=("$url/archive/$pkgver/pyt-$pkgver.tar.gz")
sha512sums=('6aae60a6101e14d283bb789a1d3a49f48ab33c5d0bd06b528eb34ec808c987242f8db185c4b7c49955c88705f24a0ff93218a13ea37e2095902bae7e555a3140')

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
