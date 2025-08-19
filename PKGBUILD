# Maintainer: taotieren <admin@taotieren.com>

pkgname=myueqf-reader
pkgver=1.1.3
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
sha256sums=('97e1636305dc4585e18ba1a38a9668403e94e650c46120420cb2be731166f9b4')
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
