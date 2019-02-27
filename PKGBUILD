# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=mohawk
pkgname=python-mohawk
pkgver=0.3.4
pkgrel=3
pkgdesc=" Python library for Hawk HTTP authorization"
arch=('any')
url="https://github.com/kumar303/mohawk"
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kumar303/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('26fd94a894cdaec1349fa05eae4e7766c63da7cad04a8a4b3eff3a3a0736f203')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
