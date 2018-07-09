# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.3
pkgname=r-xfun
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Miscellaneous Functions by Yihui Xie'
arch=('any')
url='https://cran.r-project.org/package=xfun'
license=('MIT')
depends=('r' )
optdepends=('r-testit' 'r-rstudioapi' 'r-tinytex' 'r-mime' 'r-markdown' 'r-knitr' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/xfun_"$_cranver".tar.gz")
md5sums=('bd8bac6a329a1c99dd1f9ddb7e80917a')

build(){
    R CMD INSTALL xfun_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xfun "$pkgdir"/usr/lib/R/library
}

