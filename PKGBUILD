# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=0.1.5
pkgrel=1
pkgdesc='GTK+ 3 client for Mastodon'
arch=(any)
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(glib2 gtk3 hicolor-icon-theme libsoup granite json-glib)
makedepends=(git
             desktop-file-utils
             intltool
             yelp-tools
             gnome-common
             gobject-introspection
             meson
             ninja
             vala)
provides=(tootle)
conflicts=(tootle)
options=(!libtool)
source=(git+$url)
sha512sums=(SKIP)

build() {
  cd tootle
  arch-meson build
  ninja -C build
}

package() {
  cd tootle
  DESTDIR=$pkgdir ninja -C build install
}
