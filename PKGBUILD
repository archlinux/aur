# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rmarkdown
_cranver=1.9
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rmarkdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dynamic Documents for R"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL3')
depends=('r' 'r-knitr' 'r-yaml' 'r-htmltools' 'r-evaluate' 'r-base64enc' 'r-jsonlite' 'r-rprojroot' 'r-mime' 'r-stringr')

optdepends=('r-tinytex' 'r-shiny' 'r-tufte' 'r-testthat' 'r-digest' 'r-tibble')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c70c29545cc7af6c907a8dedec7aa7ce')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

