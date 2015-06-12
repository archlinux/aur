# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-codepy
_pkgname=codepy
pkgver=2013.1.2
pkgrel=1
pkgdesc="A C/C++ metaprogramming toolkit for Python"
arch=('any')
url="http://mathema.tician.de/software/codepy"
license=('MIT')
depends=('python2-cgen')
makedepends=('python2-pytools')
optdepends=('boost-libs: Using generated C++ bindings without CUDA')
source=("http://pypi.python.org/packages/source/c/codepy/$_pkgname-$pkgver.tar.gz")
md5sums=('257e0c14a4bdd60cb58f8b775c2db395')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

