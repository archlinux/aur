# Maintainer: winnie <aur@msgpeek.net>

_py="python"
_eggname="pylstar"
pkgname=${_py}-${_eggname}
pkgver=0.1.2
pkgrel=1
pkgdesc="pylstar is a free and open source Python implementation of the LSTAR Grammatical inference algorithm. At the moment egg is pulled from git. This is temporary, will be packaged as realease soon."
arch=('any')
url="https://github.com/gbossert/pylstar"
license=('GPL3')
depends=("${_py}")
makedepends=("${_py}-setuptools")
options=(!emptydirs)
source=(${_eggname}-v${pkgver}.tar.gz::https://github.com/gbossert/pylstar/archive/Releases/pylstar-${pkgver}.tar.gz)
provides=('python-pylstar')
sha256sums=('b65d5977172c3cb90317873aa952e8d01caeebcb51442cc0bc945063ba6ebfb5')

package() {
  cd "${srcdir}/${_eggname}-Releases-${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
