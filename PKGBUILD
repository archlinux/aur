# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=rnaturalearth
_cranver=1.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="World Map Data from Natural Earth"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT + file LICENSE')
depends=(
    'r>=3.1.1'
    'r-httr>=1.1.0'
    'r-jsonlite'
    'r-sf>=0.3-4'
    'r-terra'
)
optdepends=(
    'r-devtools>=1.10.0'
    'r-dplyr'
    'r-ggplot2'
    'r-ggrepel'
    'r-knitr>=1.12.3'
    'r-lifecycle>=1.0.3'
    'r-pbapply'
    'r-purrr'
    'r-rlang'
    'r-rmarkdown'
    'r-rnaturalearthdata>=0.1.0'
    'r-rnaturalearthhires>=0.1.0'
    'r-testthat>=0.9.1'
    'r-tmap'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('896198493afe42bde56a27fd4b1e597595241bfd01048e87a6c78cd6923dcf68bda7f43945adc9944e4dcdb107cc32d0a1a815fdbff72afe76f9098d3fbf8c49')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
