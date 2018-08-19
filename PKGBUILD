# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=3.98-1.16
pkgname=r-xml
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Tools for Parsing and Generating XML Within R and S-Plus'
arch=('x86_64')
url='https://cran.r-project.org/package=XML'
license=('BSD_2_clause + file LICENSE')
depends=('r' 'libxml2')
optdepends=('r-bitops' 'r-rcurl')
replaces=('r-cran-xml')
source=("https://cran.r-project.org/src/contrib/XML_"$_cranver".tar.gz")
md5sums=('b2cd5b2a5b83f2a33658310e99b59fd5')

build(){
    R CMD INSTALL XML_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership XML "$pkgdir"/usr/lib/R/library
}

