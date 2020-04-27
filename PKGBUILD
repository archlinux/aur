# Maintainer: winnie <aur@msgpeek.net>

_py="python"
_eggname="bintrees"
pkgname=${_py}-${_eggname}
pkgver=2.1.0
pkgrel=1
pkgdesc="Package provides Binary-, RedBlack- and AVL-Trees in Python and Cython."
arch=('any')
url="https://pypi.python.org/pypi/bintrees/"
license=('MIT')
depends=("${_py}")
makedepends=("${_py}-setuptools")
optdepends=("cython2: usage of C implementation")
options=(!emptydirs)
source=(${_eggname}-v${pkgver}.tar.gz::https://github.com/mozman/bintrees/archive/v${pkgver}.tar.gz)
provides=('python-bintrees')
sha256sums=('2fe53a7c4650b61557372b923a98da2219c2742286aa7395d9275b2297a1e05c')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
