# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=ISOweek
pkgname=r-isoweek
pkgver=0.6
pkgrel=2
pkgdesc="Week of the year and weekday according to ISO 8601"
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-stringr')
makedepends=()
optdepends=('r-testthat')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver-$pkgrel.tar.gz")
sha512sums=('74633385798f29a3a1ff257c2af460be382a695cd7ab22517557a7407b795e246602b3a6fe9003efaf7309479ceb766738c38f527db6f47cc5ffa6c582c6e1db')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver-$pkgrel.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
