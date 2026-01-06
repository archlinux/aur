# Maintainer: David Sultaniiazov <x1z53@alt-gnome.ru>

pkgname=libapi-base-git
pkgver=4.3
pkgrel=1
pkgdesc='Base objects for API libraries'
url='https://altlinux.space/rirusha/libapi-base'
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=(
  'meson'
  'vala'
  'libgee'
  'json-glib'
  'libsoup3'
  'gobject-introspection'
)
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

build() {
  cd $pkgname

  meson setup _build --prefix=/usr
}

package() {
  cd $pkgname

  meson install -C _build
}

pkgver() {
  cd $pkgname

  git describe --tags | sed 's|v\([^:]*\).*|\1|'
}
