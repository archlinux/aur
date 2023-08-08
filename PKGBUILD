# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=opencpu
_pkgver=2.2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Producing and Reproducing Results"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache)
depends=(
  pandoc
  r-brew
  r-curl
  r-evaluate
  r-httpuv
  r-jsonlite
  r-knitr
  r-mime
  r-openssl
  r-protolite
  r-rappdirs
  r-remotes
  r-rlang
  r-sys
  r-vctrs
  r-webutils
  r-zip
)
optdepends=(
  apparmor
  r-arrow
  r-haven
  r-pander
  r-r.rsp
  r-svglite
  r-unix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('24b7991213fd80293dbd775721ee3bb7')
sha256sums=('7a80dca3c1c712e89c887c206c03de4487e4402a4d41563344bb76c4fe72bbc1')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
