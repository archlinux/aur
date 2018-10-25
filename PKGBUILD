# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy
pkgver=1.3
pkgrel=1
pkgdesc="Lazy attributes for Python objects"
url="https://github.com/stefanholek/lazy"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefanholek/lazy/archive/$pkgver.tar.gz")
sha512sums=('04f7560a327781076cffe2c9e104d2a282332cc48282ca35b792c921fe1c5bbe129b719c9b1fa612e2d163e304773f6ed6445ce2abd5bde06462117eb78ce0e2')

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
