# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=minqa
_cranver=1.2.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-minqa
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Derivative-free optimization algorithms by quadratic approximation"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-rcpp')
makedepends=('make' 'gcc-fortran')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('bcaae4fdba60a33528f2116e2fd51105')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}


