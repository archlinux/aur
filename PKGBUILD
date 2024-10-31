# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COSNet
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cost Sensitive Network for node label prediction on graphs with highly unbalanced labelings"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-bionetdata
  r-perfmeas
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fefba7ec494488bdddf41fec06e21024')
b2sums=('e2d81a1bc6bb2e49fb541796fa741940def95ca486088252d69e9a34df4bdf8f20fb82436e273d190db269843e77eb4814bf5076536e014817ce8c0a655a154e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
