# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.6.16
pkgname=r-digest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Create Compact Hash Digests of R Objects'
arch=('x86_64')
url='https://cran.r-project.org/package=digest'
license=('GPL')
depends=('r' )
optdepends=('r-knitr' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/digest_"$_cranver".tar.gz")
md5sums=('64d8b514861bbbb3d1fbb386aa286dcb')

build(){
    R CMD INSTALL digest_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership digest "$pkgdir"/usr/lib/R/library
}

