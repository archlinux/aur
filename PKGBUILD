# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=opencpu
_pkgver=2.2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Producing and Reproducing Results"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
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
b2sums=('b603b93462575bf66ce42798b200024d06b4fa7c5a4a1167d46aa092f9ab453eee5d0e005bdbc5908e130091b6cfa3604f43cf05b05c1475d51d6f36baf2364f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
