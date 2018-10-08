# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.19-2
pkgname=r-coda
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Output Analysis and Diagnostics for MCMC'
arch=('any')
url='https://cran.r-project.org/package=coda'
license=('GPL')
depends=('r' )
replaces=('r-cran-coda')
source=("https://cran.r-project.org/src/contrib/coda_"$_cranver".tar.gz")
md5sums=('0c5d6b732fe5bcb7a8e52ae3ae6a311f')

build(){
    R CMD INSTALL coda_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership coda "$pkgdir"/usr/lib/R/library
}

