# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logger
_pkgver=0.4.1
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
md5sums=('fcec3cd7d63f2fd84f357e4e9a444e90')
b2sums=('2cfb77828be6a738f0ccb844d34ca7c19605738953467bf590315384f617dc7a6fc59bd73003e4a5e3ccfd8fe0850f3409947e71d5f888d83ae714bff93b8d04')

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
