# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=dplyr
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Grammar of Data Manipulation"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2.0' r-ellipsis r-generics 'r-glue>=1.3.2' 'r-lifecycle>=0.2.0' 'r-magrittr>=1.5' r-r6 'r-rlang>=0.4.7' 'r-tibble>=2.1.3' 'r-tidyselect>=1.1.0' 'r-vctrs>=0.3.2')
optdepends=(r-bench r-broom r-callr r-covr r-dbi r-dbplyr r-knitr r-lahman r-lobstr r-microbenchmark r-nycflights13 r-purrr r-rmarkdown r-rmysql r-rpostgresql r-rsqlite r-testthat r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('eef5c65425e70b4f3be766d734be3ce7')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
