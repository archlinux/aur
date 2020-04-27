# Maintainer: winnie <aur@msgpeek.net>

_py="python"
_eggname="minepy"
pkgname=${_py}-${_eggname}
pkgver=1.2.4
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
sha256sums=('12cdc395267ddb3c327f002a3977bcd09675b0aae2d0939192c9376cbabb813a')

package() {
  cd "${srcdir}/${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
