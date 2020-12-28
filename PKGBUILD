# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyfinite
pkgname=python-$_pkgname
pkgver=1.7
pkgrel=1
pkgdesc="Finite field operations and erasure correction codes"
arch=('any')
url="https://github.com/emin63/pyfinite"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f3cf8daa0f3a5556b8e11008a4c8fd5bf9a60f97dbebe6736737774ccecea39e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
