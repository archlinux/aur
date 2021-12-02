# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyBrowserID
pkgname=python-browserid
pkgver=0.14.0
pkgrel=11
pkgdesc='Python client library for the BrowserID protocol'
arch=('any')
url='https://github.com/mozilla/PyBrowserID'
license=('MPL2')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-mock')
source=("https://github.com/mozilla/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2a59531db7a847fbc1cdd0449e601149e3bab33a8b5629f23bc40c5794b83932')

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
