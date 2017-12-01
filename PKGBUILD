# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalburst
_pkgname=${pkgname}
pkgver=1.4.4
pkgrel=7
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio' 'lalsimulation')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('2fc15ecd5cf195c2794234977f2c320efbcab2f294a03f8b5eda9ac7edbc93f1')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=${pkgdir}/usr CFLAGS='-O3 -Wno-error'
    make -j
}
#check() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#    make -j check
#}
package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install
}
