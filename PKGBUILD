# Maintainer: Soc Virnyl S. Estela <renegan.ronin@gmail.com>

_pkgname=river-tag-overlay
pkgname=$_pkgname-git
pkgver=r20.0f430b4
pkgrel=1
pkgdesc="A tool for the river Wayland compositor that will show a pop-up with symbolic information about the currently focused and occupied tags whenever the tag focus changes."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~leon_plickat/river-tag-overlay"
license=('GPL3')
makedepends=('make' 'git' 'pkgconf' 'pixman' 'wayland' 'wayland-protocols')
source=("${pkgname}::git+$url")
sha256sums=('SKIP')
provides=("river-tag-overlay")
conflicts=("river-tag-overlay")
options=(!strip)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make install PREFIX="${pkgdir}/usr"
}
