# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-rapi
_pkgname=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rapi"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>3.4.0' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/rapi/archive/v$pkgver.tar.gz")
sha256sums=('8fe6897769a65d6d68caf719a7bc7ab9fab59e2b16031486cad45b58fb3b5847')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
