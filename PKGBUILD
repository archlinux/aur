# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.2.1
pkgrel=1
pkgdesc='Hawk authentication strategy for the requests python library'
arch=('any')
url='https://github.com/mozilla-services/requests-hawk'
license=('Apache')
depends=('python-mohawk' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/mozilla-services/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9259bb0cb7be376e87708ad1535865ede4255072b3382d7119e8974072bb6b71')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  python setup.py test
}

package() {
  cd $_pkgname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
