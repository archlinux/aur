# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=2.18.0
pkgname=r-stanheaders
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='C++ Header Files for Stan'
arch=('x86_64')
url='https://cran.r-project.org/package=StanHeaders'
license=('BSD')
depends=('r' )
optdepends=('r-rcpp' 'r-rcppeigen' 'r-bh' 'r-knitr' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/StanHeaders_"$_cranver".tar.gz")
md5sums=('e785eda4045fc9ebbe82564fb84deeab')

build(){
    R CMD INSTALL StanHeaders_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership StanHeaders "$pkgdir"/usr/lib/R/library
}

