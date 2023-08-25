# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=rnaturalearth
_cranver=0.3.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="World Map Data from Natural Earth"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT + file LICENSE')
depends=(
    'r>=3.1.1'
    'r-sp>=1.0.15'
    'r-sf>=0.3-4'
    'r-httr>=1.1.0'
    'r-jsonlite'
    'r-terra'
)
optdepends=(
    'r-ggrepel'
    'r-knitr>=1.12.3'
    'r-testthat>=0.9.1'
    'r-devtools>=1.10.0'
    'r-rnaturalearthdata>=0.1.0'
    'r-rnaturalearthhires>=0.1.0'
    'r-pbapply'
    'r-ggplot2'
    'r-dplyr'
    'r-purrr'
    'r-rmarkdown'
    'r-tmap'
    'r-lifecycle>=1.0.3'
    'r-rlang'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('be2a22678f49be3328cef7aa311fc57bc60cce0644f292c4c752a302f584b113337439ae20a73a1dd03b9bd8d091ae54c572e04ed9a4c4763508507d0d207582')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
