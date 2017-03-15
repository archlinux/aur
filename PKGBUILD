# Maintainer: Sergej "winnie" Schmidt <sergej@hex.house>

_py="python"
_eggname="minepy"
pkgname=${_py}-${_eggname}
pkgver=1.2.0
pkgrel=1
pkgdesc="minepy provides an ANSI C library for the Maximal Information-based Nonparametric Exploration (MIC and MINE family)"
arch=('any')
url="https://minepy.readthedocs.io"
license=('GPL3')
depends=("${_py}" "${_py}-numpy" "${_py}-sphinx")
makedepends=("${_py}-setuptools")
options=(!emptydirs)
source=(${_eggname}-${pkgver}.tar.gz::https://github.com/minepy/minepy/archive/${pkgver}.tar.gz)
provides=('python-minepy')
sha256sums=('4c27086a9303807c88125726c999ceb3331a8e7a00f7801d9989f00e7afdf950')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
