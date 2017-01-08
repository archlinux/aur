# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=tapclean
_pkgname=tapclean
pkgver=0.32
_pkgver="v0_32"
pkgrel=1
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tapclean"
license=('GPL2')
depends=()
source=("${pkgname}-${pkgver}.tgz::http://tapclean.cvs.sourceforge.net/viewvc/tapclean/${pkgname}/?view=tar&pathrev=${_pkgver}")
md5sums=('SKIP') # sf.net tarballs are not constant


#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}
