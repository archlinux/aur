pkgname=yup
_pkgname=yup
pkgver="1.1.1"
_pkgver="1.1.1"
pkgrel=1
pkgdesc="Arch Linux AUR Helper with ncurses functionality and better searching and sorting"
arch=('any')
url="https://github.com/ericm/yup"
license=('GPL3')
source=("${_pkgname}::git+https://github.com/ericm/yup.git#tag=v${_pkgver}")
sha256sums=('SKIP')

depends=('pacman>=5.1' 'git' 'ncurses' 'sudo')
makedepends=('go>=1.12' 'make' 'pkgconf' 'gcc')

prepare() {
    cd "${_pkgname}"
    make
}

package() {
    install -dm755 ${pkgdir}/usr/local/bin/${BINAME}
    install -dm755 ${pkgdir}/usr/share/zsh/site-functions/_${BINAME}
    cd "${_pkgname}"
    cp ${_pkgname} ${pkgdir}/usr/local/bin/${BINAME}
    cp completions/zsh ${pkgdir}/usr/share/zsh/site-functions/_${BINAME}
}
