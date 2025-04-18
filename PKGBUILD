# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dm.eg.db
_pkgver=3.21.0
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
md5sums=('36c33d9e53a8028c72104c72e776f946')
b2sums=('52e4fc605abb851f7eb83b26cae2f7dc6996977adbfb94887fd52b2f7123529d43053982cc5b21cacf375688937567352409ea86da2231aa7608111c57dbe109')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
