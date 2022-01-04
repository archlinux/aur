# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=dtplyr
_cranver=1.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-dtplyr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides a data.table backend for 'dplyr'"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r>=3.3' 'r-crayon' 'r-data.table>=1.13.0' 'r-dplyr>=1.0.3' 'r-ellipsis' 'r-glue' 'r-lifecycle' 'r-rlang' 'r-tibble' 'r-tidyselect' 'r-vctrs')

optdepends=('r-bench' 'r-covr' 'r-knitr' 'r-rmarkdown' 'r-testthat>=3.0.0' 'r-tidyr>=1.1.0')
sha256sums=('a6dedfb6dd80dfc1d29d005ab634c060b7bfda8cb49835ece84d3b7d12077414')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
