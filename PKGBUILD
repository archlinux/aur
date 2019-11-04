# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.3
pkgrel=2
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('any')
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c5c77d0b7e04afd9d52234fb8d3715485b999a62f24c1756ca120f108b28cf17')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
