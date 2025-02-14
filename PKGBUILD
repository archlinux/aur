# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=47.10
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
sha256sums=('e6b9b0c8d5df4f476b90d991f728851e58d2fd0f13cc16c863908f4afbe0fdf9')

build() {
  arch-meson "$pkgname" build --buildtype=release
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
