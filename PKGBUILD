# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=spin2cpp
_pkgname=spin2cpp
pkgver=3.6.3
pkgrel=1
pkgdesc="Tool to convert Parallax Propeller Spin code to PASM, C++ or C"
arch=('x86_64' 'i686')
url="https://github.com/totalspectrum/spin2cpp"
license=('unknown')
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
md5sums=('579f55984356464682aeb4439fd3cd41')


build()
{
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make
}

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 "build/spin2cpp" "${pkgdir}/usr/bin/spin2cpp"
  install -Dm 755 "build/fastspin" "${pkgdir}/usr/bin/fastspin"
  install -Dm 755 "spinconvert/spinconvert.tcl" "${pkgdir}/usr/bin/spinconvert"
}

#
# EOF
#
