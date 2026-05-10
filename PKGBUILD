# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logger
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Lightweight, Modern and Flexible Logging Utility"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-botor
  r-cli
  r-covr
  r-crayon
  r-devtools
  r-glue
  r-jsonlite
  r-knitr
  r-mirai
  r-ntfy
  r-pander
  r-r.utils
  r-rmarkdown
  r-roxygen2
  r-rpushbullet
  r-rsyslog
  r-shiny
  r-slackr
  r-syslognet
  r-telegram
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f6a3cc1ed3caf7c0dc8d8efc305c841')
b2sums=('9f346e82b164fe234102a338043702729263342f0b4196bc9a01830041ad8b1563251ee5d7d37b0214c1c4175deb5f2d347dac1736fffbe1e72ca250aa817c07')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
