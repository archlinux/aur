# Maintainer: taotieren <admin@taotieren.com>

pkgname=myueqf-reader
pkgver=1.2.0
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
sha256sums=('2dcd035e2752f03e0e285a5e64fb8c5f86ab6ef7d36360ca4d098f9a8f9fa165')
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
