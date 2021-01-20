# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=dplyr
_cranver=1.0.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Grammar of Data Manipulation"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.3.0' r-ellipsis r-generics 'r-glue>=1.3.2' 'r-lifecycle>=0.2.0' 'r-magrittr>=1.5' r-r6 'r-rlang>=0.4.9' 'r-tibble>=2.1.3' 'r-tidyselect>=1.1.0' 'r-vctrs>=0.3.5')
optdepends=(r-bench r-broom r-callr r-covr r-dbi r-dbplyr r-knitr r-lahman r-lobstr r-microbenchmark r-nycflights13 r-purrr r-rmarkdown r-rmysql r-rpostgresql r-rsqlite r-testthat r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('28a1a9d87e99154d4d1542ef9da9fd70f869a173dc9709f4583a5770bae58441')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
