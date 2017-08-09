# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=p1load
_pkgname=p1load
pkgver=0.1
pkgrel=1
pkgdesc="Parallax Propeller loader with a sample program"
arch=('x86_64' 'i686')
url="https://github.com/dbetz/p1load"
license=('unknown')
groups=()
depends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/dbetz/p1load/archive/v${pkgver}.tar.gz")
md5sums=('f9e63cbf091c35597ebd60da4671b29e')


#pkgver()
#{
#  cd "${srcdir}/${_pkgname}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build()
{
  #cd "${srcdir}/${_pkgname}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make OS=linux
}

package()
{
  #cd "${srcdir}/${_pkgname}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #make install
  install -Dm 755 "bin/linux/p1load" "${pkgdir}/usr/bin/p1load"
}

#
# EOF
#
