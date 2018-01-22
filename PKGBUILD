# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=pillar
_cranver=1.1.0
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Format columns of data using the full range of colours in modern terminals."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('r-pillar')
provides=('r-pillar')
depends=('r' 'r-cran-cli' 'r-crayon>=1.3.4' 'r-cran-rlang' 'r-cran-utf8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('58a29e8d0d3a47150caf8cb1aba5dc5eca233ac8d4626f4b23beb8b5ae9003be')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
