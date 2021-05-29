# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=ggthemes
pkgname=r-$_pkgname
pkgver=4.2.4
pkgrel=1
pkgdesc="Extra Themes, Scales and Geoms for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-ggplot2' 'r-purrr' 'r-scales' 'r-stringr' 'r-tibble')
makedepends=()
optdepends=('r-dplyr' 'r-covr' 'r-extrafont' 'r-glue' 'r-knitr' 'r-lattice' 'r-lintr' 'r-maps' 'r-mapproj' 'r-pander' 'r-rlang' 'r-rmarkdown' 'r-spelling' 'r-testthat' 'r-tidyr' 'r-vdiffr' 'r-withr')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('70aca67975581dc451c03f204637feff5527c7cc170c67b678b0fca8f947f27dedcf541dc56ee6cf6622a05ec10188509a60ec887cb1ef2b7001f221a4706471')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
