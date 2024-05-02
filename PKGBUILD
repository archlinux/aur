# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Rn.eg.db
_pkgver=3.19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Rat"
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
md5sums=('f2bda03a6a42e5ea7a8ed895c0e9a32f')
b2sums=('160665257c0a6c663add5da1824c2e86771aa6cfa742453ca15979eb20aacc9b7360db06f041d9f633597454b735ed60fb50252857fd82d009d38a0a76a4e542')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
