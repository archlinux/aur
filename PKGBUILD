# Maintainer: Sergej "winnie" Schmidt <sergej@hex.house>

_py="python"
_eggname="pylstar"
pkgname=${_py}-${_eggname}
pkgver=0.1.1
pkgrel=1
pkgdesc="pylstar is a free and open source Python implementation of the LSTAR Grammatical inference algorithm. At the moment egg is pulled from git. This is temporary, will be packaged as realease soon."
arch=('any')
url="https://github.com/gbossert/pylstar"
license=('GPL3')
depends=("${_py}")
makedepends=("${_py}-setuptools")
options=(!emptydirs)
source=(${_eggname}-v${pkgver}.tar.gz::https://github.com/gbossert/pylstar/archive/Release/pylstar-${pkgver}.tar.gz)
provides=('python-pylstar')
sha256sums=('aa56f8e21e49ce58412d67d0df278de68cbc93c058bdba22e645a68c815389b0')

package() {
  cd "${srcdir}/${_eggname}-Release-${_eggname}-${pkgver}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
