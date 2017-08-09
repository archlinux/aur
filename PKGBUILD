# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=propasm-git
_pkgname=propasm
pkgver=r20.ebf0098
pkgrel=1
pkgdesc="Tool to convert Parallax Propeller Spin code to PASM, C++ or C"
arch=("any")
url="https://github.com/cbiffle/propasm"
license=('unknown')
groups=()
depends=("java-runtime")
makedepends=("java-environment" "apache-ant")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/cbiffle/propasm.git")
md5sums=("SKIP")


pkgver()
{
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}"
  ant
}

package()
{
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "propasm.jar" "${pkgdir}/usr/share/propasm/propasm.jar"
}

#
# EOF
#
