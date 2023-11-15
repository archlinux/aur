# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=5.1.0
pkgrel=1
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-case')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('9ed1f18fba76fb34ed1f083a29db5a90ccffef83dbb6c2c90f83e4136520d8a27fa8b12a7ea6923c8f73532bf174d6403484fd37e0ac26247f2108aa1faabf65')

build() {
  cd "$srcdir"/vine-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/vine-$pkgver
  python setup.py test
}

package() {
  cd vine-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
