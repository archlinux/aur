# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=xfun
_cranver=0.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-xfun
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Miscellaneous Functions by Yihui Xie'
arch=('any')
url='https://cran.r-project.org/package=xfun'
license=('MIT')
depends=('r' )
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ac7d495eb47ee60cb954bb046469737e')

build(){
    R CMD INSTALL xfun_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xfun "$pkgdir"/usr/lib/R/library
}

