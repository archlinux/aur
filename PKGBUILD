# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nullrangesData
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ExperimentHub datasets for the nullranges package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
  r-genomicranges
  r-interactionset
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f4ebf5f8328cc3c9379ed9f7f3bb900')
b2sums=('72a1eafa3af303880407f4e4e76704893a41980d161eb49b7f03d5067484c91ce8c902c571db1310f4d361ba970c2b960db7d61d4107f0ad93f8162c2bd2f66b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
