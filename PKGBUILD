# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=forcats
_cranver=0.5.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for working with categorical variables."
url="https://cran.r-project.org/package=forcats"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.2' 'r-ellipsis' 'r-magrittr' 'r-rlang' 'r-tibble')
optdepends=('r-covr' 'r-ggplot2' 'r-testthat' 'r-knitr' 'r-rmarkdown' 'r-dplyr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('efa3b3055e9167fd2a74b4386441eb1c') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
