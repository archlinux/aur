# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=3.98-1.12
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
md5sums=('a0b043a383b9815d52ebdfaedc08a68e')

build(){
    R CMD INSTALL XML_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership XML "$pkgdir"/usr/lib/R/library
}

