# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyfinite
pkgname=python-$_pkgname
pkgver=1.9
pkgrel=1
pkgdesc="Finite field operations and erasure correction codes"
arch=('any')
url="https://github.com/emin63/pyfinite"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4df2a7165bad4d8e6d73fa68d3b0d5d335758ba8517e9b3a2e1bf22ae00ec5ff')

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
