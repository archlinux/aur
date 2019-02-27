# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.0.0
pkgrel=3
pkgdesc="Hawk authentication strategy for the requests python library"
arch=('any')
url="https://github.com/mozilla-services/requests-hawk"
license=('Apache')
depends=('python-mohawk' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla-services/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('6d1be6fab72659952069048081b26e0d536f3d2960640452943cd347a1b2e117')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
