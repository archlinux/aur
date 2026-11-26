# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FIs
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human Functional Interactions (FIs) for splineTimeR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dc10d7d0555e6d654c3981734df2b84')
b2sums=('3e0f7331e6cb8b695cf89a16996db1c3375a2ed50218b2848f0fec527345b0c9a8667df120ca29c0dc002d58d3f0e35938902370eb1be709122537194188f2b1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
