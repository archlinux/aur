# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=color-scripts-git
pkgver=r59.299a816
pkgrel=1
pkgdesc="User contributed color scripts"
url="https://git.io/color.sh"
arch=(any)
license=('None')
makedepends=(git)
provides=('color-scripts')
conflicts=('color-scripts')
_name=Color-Scripts
source=("git+https://github.com/stark/Color-Scripts.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    msg "Nothing to build"

}

package() {

    cd ${srcdir}/${_name}

    msg "Installing Files"

    # color-scripts
    mkdir -p ${pkgdir}/usr/bin
    # Don't want a conflict with pacman :)
    mv color-scripts/pacman color-scripts/pacman-colors
    cp color-scripts/* ${pkgdir}/usr/bin

    # preview
    mkdir -p ${pkgdir}/usr/share/color-scripts
    cp -r preview ${pkgdir}/usr/share/color-scripts

    # test-color-support
    cp test-color-support/* ${pkgdir}/usr/bin

    # README.md
    cp README.md ${pkgdir}/usr/share/color-scripts

}
