# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=xfun
_cranver=0.13
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
md5sums=('cdc8750fbf7f071fcc15e638c948de46')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
