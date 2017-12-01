# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalcore
_pkgname=lal
pkgver=6.18.0
pkgrel=9
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('python' 'gsl' 'fftw' 'hdf5')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('464601c529f5607c251a54843e749bc9bd962055cc04ba21fdf6150e392a0ba2')
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
