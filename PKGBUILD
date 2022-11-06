# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyfinite
pkgname=python-$_pkgname
pkgver=1.9.1
pkgrel=1
pkgdesc="Finite field operations and erasure correction codes"
arch=('any')
url="https://github.com/emin63/pyfinite"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('33f58a04e814a30dcddaa73a16c46e32bc13741b097c0a4b57c7090bf5acfec0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  py.test pyfinite --doctest-modules
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
