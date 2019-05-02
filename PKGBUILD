# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=rmarkdown
_cranver=1.10
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rmarkdown
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dynamic Documents for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-knitr>=1.18' 'r-yaml>=2.1.5' 'r-htmltools>=0.3.5' 'r-evaluate>=0.8' 'r-base64enc' 'r-jsonlite' 'r-rprojroot' 'r-mime' 'r-tinytex>=0.3' 'r-stringr>=1.2.0')

optdepends=('pandoc' 'r-shiny' 'r-tufte' 'r-testthat' 'r-digest' 'r-dygraphs' 'r-tibble')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('1c923705dc968e04455b72723bd9fdb1')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

