# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dm.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Fly"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6195019bdd7c105ebd7f9cfde1ebd8a9')
b2sums=('6686a0c2eb0963d53593f844d11a4ab05f2056c5c94f3623811566ac85abe90d291d9ea82871e6b27ee170f99fddbfff5797ae2bc0e2a57afbc3ea80e0c9aa8e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
