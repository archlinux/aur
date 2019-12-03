# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=dbplyr
_cranver=1.4.2
pkgname=r-dbplyr
pkgver=${_cranver}
pkgrel=1
pkgdesc="A dplyr Back End for Databases"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT' 'custom')
depends=('r>=3.1' 'r-assertthat>=0.2.0' 'r-dbi>=1.0.0' 'r-dplyr>=0.8.0' 'r-glue>=1.2.0' 'r-purrr>=0.2.5' 'r-r6>=2.2.2' 'r-rlang>=0.2.0' 'r-tibble>=1.4.2' 'r-tidyselect>=0.2.4')
optdepends=('r-bit64' 'r-covr' 'r-knitr' 'r-lahman' 'r-nycflights13' 'r-rmariadb' 'r-rmarkdown' 'r-rmysql' 'r-rpostgresql' 'r-rsqlite' 'r-testthat' 'r-withr')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('622481e9289eb6d588e8c530a0e1fc84')

build(){
    cd "$srcdir"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
