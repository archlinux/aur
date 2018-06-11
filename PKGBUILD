# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=scales
_cranver=0.5.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="Tools for Splitting, Applying and Combining Data"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-rcolorbrewer' 'r-dichromat' 'r-plyr'
             'r-munsell' 'r-labeling' 'r-rcpp' 'r-r6' 'r-viridislite')
provides=("r-cran-${_cranname}")
conflicts=("r-cran-${_cranname}")
replaces=("r-cran-${_cranname}")
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('435f6bd826c5cf8df703ffb8a6750fd1')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
