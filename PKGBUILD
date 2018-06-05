# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=0.1.3
pkgrel=1
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'libsoup' 'granite' 'json-glib')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/bleakgrey/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('d0462237e09f70bfbb19b0ba4f8471b3e6d6a2cb11f6dd8132f095954238e323')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}
