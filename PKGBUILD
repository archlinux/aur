# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Mm.eg.db
_pkgver=3.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Mouse"
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
md5sums=('c12d125666b5f557caec8b59c1e22a95')
b2sums=('2a446d609abae3b5ca095bdddc74e0ebbfb0606818fe9bd0b82104c4841073f7321159dd0e75c6702843efed8d4b569ef06759c65a59d750c856aee5acb0420a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
