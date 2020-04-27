# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=broom
_cranver=0.5.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Convert Statistical Analysis Objects into Tidy Tibbles"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' r-backports r-dplyr 'r-generics>=0.0.2' r-purrr r-reshape2 r-stringr 'r-tibble>=3.0.0' r-tidyr)
optdepends=(r-aer r-akima r-auc r-bbmle r-betareg r-biglm r-bingroup r-boot r-brms r-car r-caret r-coda r-covr r-e1071 r-emmeans r-ergm r-gam r-gamlss r-gamlss.data r-gamlss.dist r-geepack r-ggplot2 r-glmnet r-gmm r-hmisc r-irlba r-kendall r-knitr r-ks r-lahman r-lavaan r-lfe r-lme4 r-lmodel2 r-lmtest r-lsmeans r-maps r-maptools r-mclust r-mgcv r-muhaz r-multcomp r-network r-nnet r-orcutt r-ordinal r-plm r-plyr r-polca r-psych r-quantreg r-rgeos r-rmarkdown r-rsample r-rstan r-rstanarm r-sp r-speedglm r-statnet.common r-survey r-survival r-testthat r-tseries r-zoo)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('56fb7a9229f56067f6b949e9734afd73')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
