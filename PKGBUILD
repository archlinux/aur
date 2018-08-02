# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.23-3
pkgname=r-ttr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Technical Trading Rules'
arch=('x86_64')
url='https://cran.r-project.org/package=TTR'
license=('GPL2')
depends=('r' 'r-xts>=0.10.0' 'r-zoo' 'r-curl')
optdepends=('r-runit')
makedepends=('gcc-fortran')
source=("https://cran.r-project.org/src/contrib/TTR_"$_cranver".tar.gz")
md5sums=('e4c98cbec65f559ac3c1b1d168970c50')

build(){
    R CMD INSTALL TTR_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership TTR "$pkgdir"/usr/lib/R/library
}

