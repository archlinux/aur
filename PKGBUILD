# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.1.0
pkgrel=1
pkgdesc="Hawk authentication strategy for the requests python library"
arch=('any')
url="https://github.com/mozilla-services/requests-hawk"
license=('Apache')
depends=('python-mohawk' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla-services/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('ed12a67ee0a6b1d8b6c878d99a8c5819f359acb3a69fd8b69dc95ea6106b935f')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
