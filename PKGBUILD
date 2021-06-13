# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=gtools
pkgname=r-$_pkgname
pkgver=3.9.2
pkgrel=1
pkgdesc='Various R Programming Tools'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('edec7dbbe39975764d5acb0dfe465bb31636c6de4c51ee75eec67d9ba48bd3cd025751a115a314ff776d9b2581a3ea047feab85cd66840300a705c77b4b91c5f')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ${_pkgname} "$pkgdir"/usr/lib/R/library
}
