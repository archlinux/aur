# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rmarkdown
_cranver=1.9
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rmarkdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dynamic Documents for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-knitr>=1.14' 'r-yaml>=2.1.5' 'r-htmltools>=0.3.5' 'r-evaluate>=0.8' 'r-base64enc' 'r-jsonlite' 'r-rprojroot' 'r-mime' 'r-stringr>=1.2.0')

optdepends=('pandoc' 'r-tinytex' 'r-shiny' 'r-tufte' 'r-testthat' 'r-digest' 'r-tibble')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c70c29545cc7af6c907a8dedec7aa7ce')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

