# Maintainer: taotieren <admin@taotieren.com>

pkgname=myueqf-reader
pkgver=1.2.2
pkgrel=1
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
sha256sums=('a8a76b89632fa8974abf6f6e83bce26121c2c5fac4037ce0773f289bca2cb7e5')
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
