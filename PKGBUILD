# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breastCancerVDX
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene expression datasets published by Wang et al. [2005] and Minn et al. [2007] (VDX)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-genefu
  r-survcomp
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e1d65698ad2cd168932d99c56fda1b5c')
b2sums=('c4bbc170dd3c1eca43afe0a889f42cd0dfcc83dd8fd07694bf7542f7b3f351b61cc1558397331d1e83d63f67a15a52c6f447b789ad0829da7dea88768c016068')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
