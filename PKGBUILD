# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=nloptr
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-nloptr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to NLopt"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r')
optdepends=('r-testthat>=0.8.1' 'r-knitr' 'r-rmarkdown' 'r-inline>=0.3.14')
makedepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3c475302f105dfe6a0e495ccdf4d78b1')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}


