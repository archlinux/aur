# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.6
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=(any)
url="https://github.com/mozilla/PyFxA"
license=(MPL2)
depends=(python-browserid python-cryptography python-hawkauthlib)
source=(https://github.com/mozilla/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1350a9d0201011d15ef41c8cbf74f5efb6044d6cd29b7edf5601654b6ccf7cea')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
