# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=gtools
pkgname=r-$_pkgname
pkgver=3.8.2
pkgrel=1
pkgdesc='Various R Programming Tools'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('08e3a6548a5078a241e8cf335d2bbb5ea8d09e6ce4865dbb84699faf2c96ad00534263d737c9f818c602b108009390bee3a86b5671f04d1d9213201e8d7ab6d3')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ${_pkgname} "$pkgdir"/usr/lib/R/library
}
