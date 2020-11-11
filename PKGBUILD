# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgname=mohawk
pkgname=python-mohawk
pkgver=1.1.0
pkgrel=3
pkgdesc="Python library for Hawk HTTP authorization"
arch=('any')
url="https://github.com/kumar303/mohawk"
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kumar303/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('995ecf009a92efb18a6503707e0c4d9887fe758102d824ca3e5a5625fee1b8bd')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
