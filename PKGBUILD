# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.2
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('any')
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c0ae4f70ccd5f1836418388d9eb68f256de87448086171165e7360c1bfc5ea6a')

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
