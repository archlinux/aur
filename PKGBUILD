# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=3.0.0
pkgname=r-callr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Call R from R'
arch=('any')
url='https://cran.r-project.org/package=callr'
license=('MIT')
depends=('r' 'r-base64enc' 'r-processx>=3.2.0' 'r-r6')
optdepends=('r-covr' 'r-crayon' 'r-ps' 'r-testthat' 'r-withr')
source=("https://cran.r-project.org/src/contrib/callr_"$_cranver".tar.gz")
md5sums=('ed29786f0760021d76fff26b205be2fd')

build(){
    R CMD INSTALL callr_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership callr "$pkgdir"/usr/lib/R/library
}

