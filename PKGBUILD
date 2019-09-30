# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=curl
_cranver=4.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-curl
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Modern and Flexible Web Client for R"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'curl')
optdepends=('r-askpass' 'r-spelling' 'r-testthat>=1.0.0' 'r-knitr' 'r-jsonlite' 'r-rmarkdown' 'r-magrittr' 'r-httpuv>=1.4.4' 'r-webutils')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5347e69cd7ee4193bd3a6153ee4fc757')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

