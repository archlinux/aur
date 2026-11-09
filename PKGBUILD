# Maintainer: Uffe Jakobsen -=_<_ uffe -=_<_ _at_ _>_=- uffe_dot_org _>_=-
pkgname=spin2cpp
_pkgname=spin2cpp
pkgver=7.7.3
pkgrel=1
pkgdesc="Tool to convert Parallax Propeller Spin code to PASM, C++ or C"
arch=('x86_64' 'i686')
url="https://github.com/totalspectrum/spin2cpp"
license=('MIT')
groups=()
optdepends=("tcl" "tk")
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/totalspectrum/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1828bf0b17e43e4e5845ea0b1c999e9bcf3a1c426fee0bc8c5fe209d26d25e0c')


build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 "build/spin2cpp" "${pkgdir}/usr/bin/spin2cpp"
  install -Dm 755 "build/flexspin" "${pkgdir}/usr/bin/flexspin"
  install -Dm 755 "build/flexcc" "${pkgdir}/usr/bin/flexcc"
  install -Dm 755 "spinconvert/spinconvert.tcl" "${pkgdir}/usr/bin/spinconvert"
  install -dm755 "${pkgdir}/usr/share/spin2cpp"
  cp -r include "${pkgdir}/usr/share/spin2cpp/"
  install -Dm 755 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm 755 "COPYING.LIB" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.LIB"
}

#
# EOF
#
