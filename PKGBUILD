# Maintainer: Sergej "winnie" Schmidt <winnie@violentinter.net>

_py="python2"
_eggname="bintrees"
pkgname=${_py}-${_eggname}
pkgver=2.0.4 
pkgrel=1
pkgdesc="Package provides Binary-, RedBlack- and AVL-Trees in Python and Cython."
arch=('any')
url="https://pypi.python.org/pypi/bintrees/"
license=('MIT')
depends=("${_py}")
makedepends=("${_py}-setuptools")
optdepends=("cython2: usage of C implementation") 
options=(!emptydirs)
source=(${_eggname}-${pkgver}.tar.gz::https://bitbucket.org/mozman/${_eggname}/downloads/${_eggname}-${pkgver}.tar.gz)
provides=('python2-bintrees')
sha256sums=('6cbb196106817440bda4985813856f01b277618237c5c7a1bc788c884aabe1e0')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
