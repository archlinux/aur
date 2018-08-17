# Maintainer: Ilja Kocken <i.j.kocken@uu.nl>

_cranname=fansi
_cranver=0.3.0
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Counterparts to R string manipulation functions that account for the effects of ANSI text formatting control sequences."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('r-fansi')
provides=('r-fansi')
depends=('r')
optdepends=('unitizer')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('dd6401d5c91ff4c45d752cceddd5379d1ae39a8a1196f236b0bc0ec6d691b88c')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
