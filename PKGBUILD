# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.2.2
pkgname=r-dbplyr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='A dplyr Back End for Databases'
arch=('any')
url='https://cran.r-project.org/package=dbplyr'
license=('MIT')
depends=('r' 'r-assertthat>=0.2.0' 'r-dbi>=0.7' 'r-dplyr>=0.7.4' 'r-glue>=1.2.0' 'r-purrr>=0.2.4' 'r-r6>=2.2.2' 'r-rlang>=0.1.6' 'r-tibble>=1.4.1' 'r-tidyselect>=0.2.2')
optdepends=('r-bit64' 'r-covr' 'r-knitr' 'r-lahman' 'r-nycflights13' 'r-rmarkdown' 'r-rmariadb' 'r-rmysql' 'r-rpostgresql' 'r-rsqlite' 'r-testthat' 'r-withr')
source=("https://cran.r-project.org/src/contrib/dbplyr_"$_cranver".tar.gz")
md5sums=('235c957d5912cfc989d0bd44513c2c37')

build(){
    R CMD INSTALL dbplyr_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership dbplyr "$pkgdir"/usr/lib/R/library
}

