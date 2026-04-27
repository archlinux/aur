# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=vetiver
_pkgver=0.2.7
pkgname=r-vetiver
pkgdesc="Version, Share, Deploy, and Monitor Models"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-bundle>=0.1.3"
    "r-butcher>=0.4.0"
    "r-cereal"
    "r-cli"
    "r-fs"
    "r-generics"
    "r-glue"
    "r-hardhat"
    "r-lifecycle"
    "r-pins>=1.3.0"
    "r-purrr"
    "r-rapidoc"
    "r-readr>=1.4.0"
    "r-rlang>=1.1.0"
    "r-tibble"
    "r-vctrs"
    "r-withr"
)
optdepends=(
    "r-arrow"
    "r-callr"
    "r-caret"
    "r-clustmixtype"
    "r-covr"
    "r-curl"
    "r-dplyr"
    "r-flexdashboard"
    "r-ggplot2"
    "r-httpuv"
    "r-httr"
    "r-jsonlite"
    "r-keras"
    "r-knitr"
    "r-liblinear"
    "r-luz"
    "r-mlr3>=0.17.0"
    "r-mlr3data"
    "r-mlr3learners"
    "r-mockery"
    "r-modeldata"
    "r-parsnip"
    "r-paws.machine.learning>=0.2.0"
    "r-pingr"
    "r-plotly"
    "r-plumber>=1.0.0"
    "r-probably>=1.2.0"
    "r-quantregforest"
    "r-ranger"
    "r-recipes>=1.1.0"
    "r-reticulate"
    "r-rmarkdown"
    "r-rsample"
    "r-rsconnect"
    "r-slider>=0.2.2"
    "r-smdocker>=0.1.2"
    "r-stacks"
    "r-tensorflow"
    "r-testthat>=3.1.8"
    "r-tidyselect"
    "r-torch"
    "r-tune"
    "r-vdiffr"
    "r-workflows"
    "r-xgboost"
    "r-yardstick"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53a1ca4f516c6f2f4e691d418a71938bce9c9fad0b8a6f877a22e36bd52d1adb')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${srcdir}/build/${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${srcdir}/build/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
