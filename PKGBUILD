_cranname=GCDkit
_cranver=6.0
pkgname=${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An ODBC database interface"
arch=(any)
depends=("r-rodbc" "r>3.6.0" "r-sp" "r-r2html" "r-xml")
makedepends=("tk")
url="http://www.gcdkit.org"
license=("unknown")
source=("http://www.gcdkit.org/sw/GCDkit_${pkgver}.tar.gz")
noextract=("GCDkit_${pkgver}.tar.gz")
md5sums=('8f9aeb51fc8fdcefe4d05e8d7b015553')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
