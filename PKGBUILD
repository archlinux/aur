# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-ddt
pkgver=1.6.0
pkgrel=1
pkgdesc="Data-Driven/Decorated Tests"
arch=('any')
license=('MIT')
url="https://github.com/txels/ddt"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-six' 'python38-yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/txels/ddt/archive/$pkgver.tar.gz")
sha512sums=('c5ea14d3f60384676d9631c84d938b774dd360cea9b0ee1b111692dc2bc06238b5ffd3ab8950207b77aa007bac0ac79b290533a2532be4bee68b642629843a82')

build() {
  cd ddt-$pkgver
  python3.8 setup.py build
}

check() {
  cd ddt-$pkgver
  pytest
}

package() {
  cd ddt-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
