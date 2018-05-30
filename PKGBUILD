# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=callr
_cranver=2.0.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-callr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Call R from R"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('MIT')
depends=('r' 'r-processx')

optdepends=('r-covr' 'r-testthat' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('14d542a7a422c9449beece9c82db3ade')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

