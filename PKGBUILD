# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=spin2cpp
_pkgname=spin2cpp
pkgver=7.4.4
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
sha256sums=('c1e29b3e2e67bf48ca6ba3175e67daf476ffd5c5b8b0fb2ffad2d0e47eae6742')


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
  install -Dm 755 "spinconvert/spinconvert.tcl" "${pkgdir}/usr/bin/spinconvert"
  install -Dm 755 "COPYING" "${pkgdir}//usr/share/licenses/${_pkgname}/COPYING"
  install -Dm 755 "COPYING.LIB" "${pkgdir}//usr/share/licenses/${_pkgname}/COPYING.LIB"
}

#
# EOF
#
