# Maintainer: Sergej "winnie" Schmidt <sergej@hex.house>

_py="python"
_eggname="bintrees"
pkgname=${_py}-${_eggname}
pkgver=2.0.6
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
sha256sums=('2e8733956b74a847d5525f640b55b569e90726af27c945de5ed1ec7e73363e2a')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
