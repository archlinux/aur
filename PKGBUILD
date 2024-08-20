# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grpreg
_pkgver=3.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Regularization Paths for Regression Models with Grouped Covariates"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bc7e8148a92adc041f15a05bf243e700')
b2sums=('2a5171970fc2faa62e84114ca567e2eeca54ac2388155370192d38cf28c121e51bb3df4cd04143d12b88e0f2eb4e921c46211cca12fb7ce48eb793f76e6b4127')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
