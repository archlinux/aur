# $Id$
# Maintainer: soloturn@gmail.com

_basename=libdecoration
pkgname="$_basename-git"
pkgver=0.0.1
pkgrel=0
pkgdesc="Help Wayland clients draw window decorations for them."
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/jadahl/libdecoration"
license=('jonas')
makedepends=('meson' 'ninja' 'git')
conflicts=("$_basename")
provides=("$_basename")

source=("git+https://gitlab.gnome.org/jadahl/$_basename.git")
sha1sums=('SKIP')

build() {
  pwd
  arch-meson $_basename build
  ninja -C build
}

package() {
  pwd
  DESTDIR="${pkgdir}" ninja -C build install
}

