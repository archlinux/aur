# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=mohawk
pkgname=python-mohawk
pkgver=1.0.0
pkgrel=1
pkgdesc="Python library for Hawk HTTP authorization"
arch=('any')
url="https://github.com/kumar303/mohawk"
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kumar303/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('1bc11c5d8e3a7faf03f551c1a4c682c7c83f0be5b2c28db7c88087e7c530db81')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
