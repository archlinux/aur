# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=DRR
_cranver=0.0.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-drr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dimensionality Reduction via Regression"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r' 'r-kernlab' 'r-cvst')

optdepends=('r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3642d5895c4f82061298b5e617785b0d')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

