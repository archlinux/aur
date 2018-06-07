# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=pillar
_cranver=1.2.3
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=2
pkgdesc="Format columns of data using the full range of colours in modern terminals."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('r-pillar')
provides=('r-pillar')
depends=('r' 'r-cran-cli' 'r-crayon>=1.3.4' 'r-rlang' 'r-cran-utf8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('c81d1b5c6b55d789a6717dc3c7be1200eb0efbcfc5013db00d553d9cafd6f0e7')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
