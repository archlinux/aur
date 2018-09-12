# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.6.17
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
md5sums=('e4ce9fcc5b0ae2576df5709b95b1e295')

build(){
    R CMD INSTALL digest_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership digest "$pkgdir"/usr/lib/R/library
}

