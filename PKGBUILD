# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>
_cranver=2.1.1
_cranname=testthat
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-testthat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Unit Testing for R'
arch=('x86_64')
url='https://cran.r-project.org/package=testthat'
license=('MIT')
depends=('r' 'r-cli' 'r-crayon' 'r-digest' 'r-magrittr' 'r-praise' 'r-r6>=2.2.0' 'r-rlang' 'r-withr>=2.0.0')
optdepends=('r-covr' 'r-devtools' 'r-knitr' 'r-rmarkdown' 'r-usethis' 'r-xml2')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('329062cb31384b33e1717a3366fb6440')

build(){
    R CMD INSTALL testthat_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership testthat "$pkgdir"/usr/lib/R/library
}

