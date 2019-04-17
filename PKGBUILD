# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.1
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('any')
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1419e3a382be9bec2fea9aa21d75d6a5a4d1bc4f767889f8ac32cd50460f0c4a')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
