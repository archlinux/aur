pkgname=yup-git
_pkgname=yup
pkgver=v0.1.7.beta.r2.gb3d3888
pkgrel=1
pkgdesc="Arch Linux AUR Helper with ncurses functionality and better searching and sorting"
arch=('any')
url="https://github.com/ericm/yup"
license=('GPL3')
source=("${_pkgname}::git+https://github.com/ericm/yup.git")
sha256sums=('SKIP')

depends=('pacman>=5.1' 'git' 'ncurses' 'sudo')
makedepends=('go>=1.12' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    make
}

package() {
    install -dm755 ${pkgdir}/usr/local/bin/${BINAME}
    cd "${_pkgname}"
    cp ${_pkgname} ${pkgdir}/usr/local/bin/${BINAME}

}
