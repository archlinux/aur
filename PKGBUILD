# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy
pkgver=1.4
pkgrel=1
pkgdesc="Lazy attributes for Python objects"
url="https://github.com/stefanholek/lazy"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefanholek/lazy/archive/$pkgver.tar.gz")
sha512sums=('2a735b1436d3ebc76791645631cfcf54f1e332fd365c317bee92498b10397ec8206b271ae74427cae02985808a843eb98720c91e62dce93bb75702205da161bc')

build() {
  cd lazy-$pkgver
  python setup.py build
}

check() {
  cd lazy-$pkgver
  python setup.py test
}

package() {
  cd lazy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
