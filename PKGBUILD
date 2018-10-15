# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=2.0.1
pkgname=r-testthat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Unit Testing for R'
arch=('x86_64')
url='https://cran.r-project.org/package=testthat'
license=('MIT')
depends=('r' 'r-cli' 'r-crayon' 'r-digest' 'r-magrittr' 'r-praise' 'r-r6>=2.2.0' 'r-rlang' 'r-withr>=2.0.0')
optdepends=('r-covr' 'r-devtools' 'r-knitr' 'r-rmarkdown' 'r-usethis' 'r-xml2')
source=("https://cran.r-project.org/src/contrib/testthat_"$_cranver".tar.gz")
md5sums=('d35da4e4c876c444058f7d26a10600be')

build(){
    R CMD INSTALL testthat_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership testthat "$pkgdir"/usr/lib/R/library
}

