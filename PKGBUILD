# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.6.0
pkgrel=3
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('any')
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f2732fe443d18a86a782d7b40894fc3a712497bfe225f309498b2b2e7657f753')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
