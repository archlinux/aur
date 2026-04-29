# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAlm
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Model Toolset for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-all
  r-annotate
  r-category
  r-genefilter
  r-gostats
  r-gseabase
  r-hgu95av2.db
  r-multtest
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('359e2387520ee44cb45f80a96186043a')
b2sums=('10f55bceb5ec505059da122382f1ac4a3c049ac3e7901bd7ef366f63aa7f10e795924981f5b1191d783e61dc987a57eb7e8c9ccada4efcd9286d975f0bde2f0a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
