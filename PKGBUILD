# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=47.2
pkgrel=1
pkgdesc='A terminal for a container-oriented desktop'
arch=('x86_64')
url='https://gitlab.gnome.org/chergert/ptyxis'
license=('GPL-3.0-or-later')
groups=()
depends=('dconf'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk4'
         'hicolor-icon-theme'
         'json-glib'
         'libadwaita'
         'libportal'
         'libportal-gtk4'
         'pango'
         'vte4')
makedepends=('git'
             'glib2-devel'
             'meson')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('b6ab70a45d41cd67c9e2e880c5000273ef522a3b7de385d0f5a6d2174d0aea4c')

build() {
  arch-meson "$pkgname" build --buildtype=release
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
