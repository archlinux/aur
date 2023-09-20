# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy
pkgver=1.5.1
pkgrel=1
pkgdesc="Lazy attributes for Python objects"
url="https://github.com/stefanholek/lazy"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefanholek/lazy/archive/$pkgver.tar.gz")
sha512sums=('42dc44ea3640d63aa853f113ba3bc4bdda7c2fe25c013cf90b2b0225cf9f6bbdcccebc08c2cf64c00dc17ce359a1027e06695b839ee5a3f1996ba33b862408cb')

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
