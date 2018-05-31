# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=xtable
_cranver=1.8-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-xtable
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Export Tables to LaTeX or HTML"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-knitr' 'r-lsmeans' 'r-spdep' 'r-splm' 'r-sphet' 'r-plm' 'r-zoo')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('239e4825cd046156a67efae3aac01d86')
replaces=('r-cran-xtable')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

