# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalinspiral
_pkgname=${pkgname}
pkgver=1.7.7
pkgrel=8
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio' 'lalsimulation' 'lalframe')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('cb95e290693df143b4a11f6e08cffd74b29c1beb71790f9d774d4dc159d7ffd1')
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
