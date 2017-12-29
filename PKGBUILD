# Maintainer: winnie <aur@msgpeek.net>

_py="python"
_eggname="bintrees"
pkgname=${_py}-${_eggname}
pkgver=2.0.7
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
sha256sums=('92dff437584911ae84bd7d250a87824372767101b156f8f6e91ffb026444b4c3')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
