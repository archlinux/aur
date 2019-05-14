# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=editData
_cranver=0.1.2
pkgname=r-editdata
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'RStudio' Addin for Editing a 'data.frame'"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-shiny' 'r-miniui' 'r-rstudioapi' 'r-dt' 'r-tibble')
optdepends=('r-knitr' 'r-rmarkdown')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('fa8c7fb3fea5a55ac89cd3ad73237740')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
