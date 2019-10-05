# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-codepy
_pkgname=codepy
pkgver=2019.1
pkgrel=1
pkgdesc="A C/C++ metaprogramming toolkit for Python"
arch=('any')
url="http://mathema.tician.de/software/codepy"
license=('MIT')
depends=('python2-cgen')
makedepends=('python2-pytools')
optdepends=('boost-libs: Using generated C++ bindings without CUDA')
source=("https://github.com/inducer/codepy/archive/v$pkgver.tar.gz")
sha256sums=('c73c7457060419fe6f579b25d51e13c7e7ba01b405e8e36b069cdfa3477a5587')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

