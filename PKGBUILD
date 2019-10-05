# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.10
pkgname=r-xfun
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Miscellaneous Functions by Yihui Xie'
arch=('any')
url='https://cran.r-project.org/package=xfun'
license=('MIT')
depends=('r')
optdepends=('r-testit' 'r-rstudioapi' 'r-tinytex' 'r-mime' 'r-markdown' 'r-knitr' 'r-htmltools' 'r-base64enc' 'r-remotes' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('240a08003fc090c2a03cc21e4075afa8')

build(){
    R CMD INSTALL xfun_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xfun "$pkgdir"/usr/lib/R/library
}
