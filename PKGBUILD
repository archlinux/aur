# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyselect
_cranver=1.0.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Select from a set of strings."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.2' 'r-ellipsis' 'r-glue>=1.3.0' 'r-purrr>=0.3.2' 'r-rlang>=0.4.3' 'r-vctrs>=0.2.2')
optdepends=('r-covr' 'r-crayon' 'r-dplyr' 'r-knitr' 'r-magrittr' 'r-rmarkdown' 'r-testthat' 'r-tibble' 'r-withr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('dfb73f5fc014d8ea96a66d4c3776ae0b')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
