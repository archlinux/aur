# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=gdata
pkgname=r-$_pkgname
pkgver=2.18.0
pkgrel=1
pkgdesc='Various R Programming Tools for Data Manipulation'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL2')
depends=('r-gtools')
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('609a412970d46bed0d12191b1015fac96b48244cb9fb35506be07ae0544583566669c0e233a52f418dafdfc787a92cfbbf6554cb336af06c257b3bb6058e4fd5')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ${_pkgname} "$pkgdir"/usr/lib/R/library
}
