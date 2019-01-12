#Maintainer: Lubosz <lubosz@gmail.com>
#Contributor: helq <linuxero789@gmail.com>
#Contributor: junglerobba <tobias.langendorf@gmail.com>

pkgname=gsettings-desktop-schemas-dev
_realpkgname=gsettings-desktop-schemas
pkgver=3.31.0.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=('GPL')
depends=(glib2-git intltool)
makedepends=(git meson gobject-introspection)

provides=("${_realpkgname}")
conflicts=("${_realpkgname}")

source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson gsettings-desktop-schemas build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
