# Maintainer: taotieren <admin@taotieren.com>

pkgname=myueqf-reader
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="A simple TXT ebook reader"
arch=($CARCH)
url="https://github.com/myueqf/reader"
license=('GPL-3.0-or-later')
groups=()
depends=(
    dconf
    glib2
    glibc
    gtk4
    gdk-pixbuf2
    hicolor-icon-theme
    libadwaita
    libgee
    json-glib
    pango
)
makedepends=(
    cmake
    git
    meson
    ninja
    vala
)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('54f14c7dec2fa1c8f1ccea9ffa7eecb61014264126cf05b6dc8850448e4b0b1c')
#validpgpkeys=()

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

# check() {
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
