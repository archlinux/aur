# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.0.1
pkgrel=2
pkgdesc="Hawk authentication strategy for the requests python library"
arch=('any')
url="https://github.com/mozilla-services/requests-hawk"
license=('Apache')
depends=('python-mohawk' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla-services/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('022ab238a42d62bfb594bfe7cb7535dd75e2bd189ec2e3a365cd2ee23df300ad')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
