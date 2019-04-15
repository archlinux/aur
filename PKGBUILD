# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=scales
_cranver=1.0.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=3
pkgdesc="Tools for Splitting, Applying and Combining Data"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1' 'r-rcolorbrewer' 'r-plyr'
             'r-munsell>=0.5' 'r-labeling' 'r-rcpp' 'r-r6' 'r-viridislite')
optdepends=('r-dichromat')
provides=("r-cran-${_cranname}")
conflicts=("r-cran-${_cranname}")
replaces=("r-cran-${_cranname}")
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0c1f4a14edd336a404da34a3cc71a6a9d0ca2040ba19360c41a79f36e06ca30c')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
