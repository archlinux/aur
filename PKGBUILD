# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.7
pkgname=r-tinytex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Helper Functions to Install and Maintain TeX Live, and Compile LaTeX Documents'
arch=('any')
url='https://cran.r-project.org/package=tinytex'
license=('MIT')
depends=('r' 'r-xfun>=0.3')
optdepends=('r-testit')
source=("https://cran.r-project.org/src/contrib/tinytex_"$_cranver".tar.gz")
md5sums=('105a001575dd59f7e1a613211c4308b5')

build(){
    R CMD INSTALL tinytex_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership tinytex "$pkgdir"/usr/lib/R/library
}

