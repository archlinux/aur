# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=BH
_cranver=1.72.0-3
pkgname=r-bh
pkgver=1.72.0_3
pkgrel=1
pkgdesc="Boost C++ Header Files"
url="https://cran.r-project.org/package=BH"
arch=('any')
license=('BSL-1.0')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('6125aaade08e678496128a1f0ee79493') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
