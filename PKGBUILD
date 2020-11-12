# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.7
pkgrel=2
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=(any)
url="https://github.com/mozilla/PyFxA"
license=(MPL2)
depends=(python-browserid python-cryptography python-hawkauthlib)
source=(https://github.com/mozilla/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d5b5afdafb6b42344d49e4e4df0582758df54e00b8d0fa3cbc29433410aa9a6f')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
