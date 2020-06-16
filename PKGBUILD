# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=bspwm-undo-git
_pkgname=${pkgname%-git}
pkgver=r22.972431a
pkgrel=1
pkgdesc="Undoable versions of some bspc commands."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('bspwm')
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 \
    "${srcdir}/${_pkgname}/ubspc.sh" \
    "${pkgdir}/usr/bin/ubspc"
}
