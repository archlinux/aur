# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=broom
_cranver=0.5.3
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Convert statistical analysis objects into tidy tibbles."
url="https://CRAN.R-project.org/package=broom"
arch=('any')
license=('MIT')
depends=('r>=3.1' 'r-backports' 'r-dplyr' 'r-generics>=0.0.2' 'r-purrr' 'r-reshape2' 'r-stringr' 'r-tibble' 'r-tidyr')
optdepends=('r-aer' 'r-akima' 'r-auc' 'r-bbmle' 'r-betareg' 'r-biglm' 'r-bingroup' 'r-boot' 'r-brms' 'r-btergm' 'r-car' 'r-caret' 'r-coda' 'r-covr' 'r-e1071' 'r-emmeans' 'r-ergm' 'r-gam' 'r-gamlss' 'r-gamlss.data' 'r-gamlss.dist' 'r-geepack' 'r-ggplot2' 'r-glmnet' 'r-gmm' 'r-hmisc' 'r-irlba' 'r-joinerml' 'r-kendall' 'r-knitr' 'r-ks' 'r-lahman' 'r-lavaan' 'r-lfe' 'r-lme4' 'r-lmodel2' 'r-lmtest' 'r-lsmeans' 'r-maps' 'r-maptools' 'r-matrix' 'r-mclust' 'r-mgcv' 'r-muhaz' 'r-multcomp' 'r-network' 'r-nnet' 'r-orcutt' 'r-ordinal' 'r-plm' 'r-plyr' 'r-polca' 'r-psych' 'r-quantreg' 'r-rgeos' 'r-rmarkdown' 'r-robust' 'r-rsample' 'r-rstan' 'r-rstanarm' 'r-sp' 'r-speedglm' 'r-statnet.common' 'r-survey' 'r-testthat' 'r-tseries' 'r-xergm' 'r-zoo')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('2000ccaf98f74342cd882c8be3d1344c')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
