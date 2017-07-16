# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=tapclean
pkgver=0.34
pkgrel=2
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tapclean"
license=('GPL2')
depends=()
source=("https://sourceforge.net/projects/tapclean/files/tapclean/TAPClean%200.34/${pkgname}-${pkgver}-src.tgz/download")
md5sums=('e87693fe47ed6f5b6761c6f390f7ed8b')

#_pkgname=tapclean
#_pkgver="v0_34"
#source=("${pkgname}-${pkgver}.tgz::http://tapclean.cvs.sourceforge.net/viewvc/tapclean/${pkgname}/?view=tar&pathrev=${_pkgver}")
#md5sums=('SKIP') # sf.net tarballs are not constant and hence cannot be checked/validated

#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "${srcdir}/${pkgname}/src"
  make CFLAGS+=
}

package() {
  cd "${srcdir}/${pkgname}/src"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}
