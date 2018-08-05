# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-rapi
_pkgname=${pkgname#python-}
pkgver=0.0.16
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rapi"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>3.4.0' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/rapi/archive/v$pkgver.tar.gz")
sha256sums=('ae44a6906e816461a75803afe253a09cc21d831b318e44a741ca8b4eef85cdc9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
