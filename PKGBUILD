# Maintainer: FraV1982 <consulenza.vangi@libero.it>

_pkgname=gpaste
pkgname=gpaste-upd
pkgver=43.0
pkgrel=1
_pkgrealver=43.0
_pkgrealrel=1
pkgdesc="Clipboard management system for GNOME 43, frequently updated."
url="http://support-au.canon.com.au/contents/AU/EN/0100302002.html"
arch=('x86_64')
license=('BSD')
depends=(
    'gtk3'
    'gtk4'
    'libadwaita'
    'wgetpaste'
    'appstream-glib'
    'git'
    'meson'
    'vala'
    'gobject-introspection'
)
optdepends=(
    'autoconf'
    'automake'
    'tar'
    'make'
    'gcc'
)
options=(!strip)

source=(
    'https://www.imagination-land.org/files/gpaste/GPaste-43.0.tar.xz'
)
md5sums=(
    'SKIP'
)


prepare() {
    tar -xf GPaste-43.0.tar.xz > /dev/null
}


build() {
    arch-meson --buildtype=release $srcdir/GPaste-43.0 build
  meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
