# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.2.4
pkgname=r-stringi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Character String Processing Facilities'
arch=('x86_64')
url='https://cran.r-project.org/package=stringi'
license=('custom')
depends=('r' )
source=("https://cran.r-project.org/src/contrib/stringi_"$_cranver".tar.gz")
md5sums=('aeb53ac931b033bdde5792cf8fd2e3cc')

build(){
    R CMD INSTALL stringi_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership stringi "$pkgdir"/usr/lib/R/library
}

