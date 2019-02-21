#Maintainer: junglerobba <tobias.langendorf@gmail.com>
#Contributor: Lubosz <lubosz@gmail.com>
#Contributor: helq <linuxero789@gmail.com>


pkgname=gsettings-desktop-schemas-dev
_realpkgname=gsettings-desktop-schemas
pkgver=3.31.91
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=('GPL')
depends=(glib2 intltool)
optdepends=(
  'adobe-source-code-pro-fonts: default monospace font'
)
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
