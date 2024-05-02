# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Preproc
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Preprocessing Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c923d40afe98b9d70b07d1c181ef5a55')
b2sums=('84011302d4c5cdbe29dd969795e316201a7f5a33c83caee2c6628078e2a55119b856384cf6f443220bccb4e61e39fd0925f2bd02efa36cc16e18c385f4a31884')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
