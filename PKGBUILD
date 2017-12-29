# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=pillar
_cranver=1.0.1
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Format columns of data using the full range of colours in modern terminals."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r' 'r-cran-cli' 'r-crayon>=1.3.4' 'r-cran-rlang' 'r-cran-utf8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('37946c66aceea43c4b8b16256fd2390e')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
