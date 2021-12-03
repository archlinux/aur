# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=requests-hawk
pkgname=python-requests-hawk
pkgver=1.1.1
pkgrel=2
pkgdesc='Hawk authentication strategy for the requests python library'
arch=('any')
url='https://github.com/mozilla-services/requests-hawk'
license=('Apache')
depends=('python-mohawk' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/mozilla-services/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('230eeebb65ce5aa5689f19ea0bbf9e90eb3a0767c1db3d940bbe8ad924fdb904')

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
