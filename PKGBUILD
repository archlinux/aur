# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEAdata
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene set collections for the EGSEA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-ND-4.0')
depends=(
  r
)
optdepends=(
  r-egsea
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0eb9690033a68af496638fb1eafdca42')
b2sums=('9c4877cc2332dca0808006224ba2a91d11e7224aa535f517206b25c642764e78193ade8d2cdec6ee8629c6dcc99b58014d91ec3d7d5444634570e403b831b3ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
