# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Alad Wenter <alad at archlinux dot org>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=broom
_cranver=1.0.11
pkgname=r-${_cranname,,}
pkgdesc="Convert Statistical Objects into Tidy Tibbles"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5"
    "r-backports"
    "r-dplyr>=1.0.0"
    "r-generics>=0.0.2"
    "r-glue"
    "r-lifecycle"
    "r-purrr"
    "r-rlang"
    "r-stringr"
    "r-tibble>=3.0.0"
    "r-tidyr>=1.0.0"
)
optdepends=(
    "r-aer"
    "r-auc"
    "r-bbmle"
    "r-betareg>=3.2.1"
    "r-biglm"
    "r-bingroup"
    "r-boot"
    "r-btergm>=1.10.6"
    "r-car>=3.1.2"
    "r-cardata"
    "r-caret"
    "r-cluster"
    "r-cmprsk"
    "r-coda"
    "r-covr"
    "r-drc"
    "r-e1071"
    "r-emmeans"
    "r-epir"
    "r-ergm>=3.10.4"
    "r-fixest>=0.9.0"
    "r-gam>=1.15"
    "r-gee"
    "r-geepack"
    "r-ggplot2"
    "r-glmnet"
    "r-glmnetutils"
    "r-gmm"
    "r-hmisc"
    "r-interp"
    "r-irlba"
    "r-joinerml"
    "r-kendall"
    "r-knitr"
    "r-ks"
    "r-lahman"
    "r-lavaan>=0.6.8"
    "r-leaps"
    "r-lfe"
    "r-lm.beta"
    "r-lme4"
    "r-lmodel2"
    "r-lmtest>=0.9.38"
    "r-lsmeans"
    "r-maps"
    "r-margins"
    "r-mass"
    "r-mclust"
    "r-mediation"
    "r-metafor"
    "r-mfx"
    "r-mgcv"
    "r-mlogit"
    "r-modeldata"
    "r-modeltests>=0.1.6"
    "r-muhaz"
    "r-multcomp"
    "r-network"
    "r-nnet"
    "r-orcutt>=2.2"
    "r-ordinal"
    "r-plm"
    "r-polca"
    "r-psych"
    "r-quantreg"
    "r-rmarkdown"
    "r-robust"
    "r-robustbase"
    "r-rsample"
    "r-sandwich"
    "r-spatialreg"
    "r-spdep>=1.1"
    "r-speedglm"
    "r-spelling"
    "r-survey"
    "r-survival>=3.6.4"
    "r-systemfit"
    "r-testthat>=2.1.0"
    "r-tseries"
    "r-vars"
    "r-zoo"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('a7d42e03fca556a4e402c8dc237890d0e74012de5d7cade86b33df49ee3949d862109e240bd45a0aa0892b8fef8990208b5ef5a96608e0f726a4e8c500532b2d')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
