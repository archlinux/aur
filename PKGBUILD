# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=hawkauthlib
pkgname=python-hawkauthlib
pkgver=2.0.0
pkgrel=11
pkgdesc='Low-level python library for implementing MAC Access Authentication'
arch=('any')
url='https://github.com/mozilla-services/hawkauthlib'
license=('MPL2')
depends=('python-webob')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-requests')
source=("https://github.com/mozilla-services/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5ad32548bffdf328284c4fb56770ed7a1a39309aa8639be95759df05aec7e6d1')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
