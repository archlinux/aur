# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DTA
_pkgver=2.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Transcriptome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-lsd
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56c0173bc3342953865dda5afe9659fc')
b2sums=('ed2eeb2e769d3c380fe7d67fa2cf2c5046184c18c1d0d7d44c12d925c056fb4cce4063ef0442fda56d0e3288d90151f4a82e3d9739bb65d511105b819b53c669')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
