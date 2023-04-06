# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy
pkgver=1.5
pkgrel=2
pkgdesc="Lazy attributes for Python objects"
url="https://github.com/stefanholek/lazy"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefanholek/lazy/archive/$pkgver.tar.gz")
sha512sums=('be849c405b2a8513eaa2f1e6111bb265e307c947b8f076055ad02e21f7b56f4f52c9cde362e76bfc35703b0a6dcc0675ef8684cec64bb8736f19ed171c687019')

build() {
  cd lazy-$pkgver
  python setup.py build
}

check() {
  cd lazy-$pkgver
  python -m unittest discover
}

package() {
  cd lazy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
