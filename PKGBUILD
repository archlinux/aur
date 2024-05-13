_cranname=GCDkit
_cranver=6.2
pkgname=${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An ODBC database interface"
arch=(any)
depends=("r>3.6.0" "r-foreign" "r-sp" "r-r2html" "r-xml" "r-irdisplay" "r-lattice" "r-mass")
optdepends=("r-curl" "r-rgdal" "r-rodbc" "r-tkrplot" "r-xml")
makedepends=("tk")
url="http://www.gcdkit.org"
license=("unknown")
source=("http://www.gcdkit.org/sw/${_cranname}_${pkgver}.tar.gz")
noextract=("${_cranname}_${pkgver}.tar.gz")
md5sums=('545121976ebee0ef19019eef7349f601')

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
