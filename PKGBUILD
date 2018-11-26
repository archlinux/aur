# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=metaio
_pkgname=${pkgname}
pkgver=8.5.1
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cf1bb2cf9148a46e94100c72d12a48f7478dae25a0da37d58a3019f757cdb407')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=${pkgdir}/usr CFLAGS='-O3 -Wno-error'
    make -j
}
check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make -j check
}
package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install
}
