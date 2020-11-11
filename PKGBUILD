# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-urlobject
pkgver=2.4.3
pkgrel=5
pkgdesc="A utility class for manipulating URLs"
url="https://github.com/zacharyvoase/urlobject"
license=('custom:Unlicense')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zacharyvoase/urlobject/archive/v$pkgver.tar.gz")
sha512sums=('2bd08ba5695c8277eeed154d7f414939e8b471e83f1fc6b9db93931f8e49dea4583036b0b7fb8d820e0b214bdc4bf2fe78987eb6a5c63ba70611aea6365c2972')

build() {
  cd urlobject-$pkgver
  python setup.py build
}

check() {
  cd urlobject-$pkgver
  python setup.py nosetests
}

package() {
  cd urlobject-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/UNLICENSE
}
