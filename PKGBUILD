pkgname=yup
_pkgname=yup
pkgver="0.1.7_beta"
_pkgver="0.1.7-beta"
pkgrel=2
pkgdesc="Arch Linux AUR Helper with ncurses functionality and better searching and sorting"
arch=('any')
url="https://github.com/ericm/yup"
license=('GPL3')
source=("${_pkgname}::git+https://github.com/ericm/yup.git#tag=v${_pkgver}")
sha256sums=('SKIP')

depends=('pacman>=5.1' 'git' 'ncurses' 'sudo')
makedepends=('go>=1.12' 'make')

prepare() {
    cd "${_pkgname}"
    make
}

package() {
    install -dm755 ${pkgdir}/usr/local/bin/${BINAME}
    cd "${_pkgname}"
    cp ${_pkgname} ${pkgdir}/usr/local/bin/${BINAME}

}
