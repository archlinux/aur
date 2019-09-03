# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.9
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
md5sums=('a336fa5d53795d1757c5f7b8cb4a6d37')

build(){
    R CMD INSTALL xfun_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xfun "$pkgdir"/usr/lib/R/library
}

