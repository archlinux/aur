# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logger
_pkgver=0.4.0
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
md5sums=('7b27620ac3f2bd4e927d608199cae758')
b2sums=('50422fc9ec3f49e48cd5a762293196e6477cb48fe6d4ad7bf2fe29caa1fefc1e33e77efcc85672815ce04c88794ccef7f1e987272de60a812190d654167f723f')

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
