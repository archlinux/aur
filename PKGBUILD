# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=0.1.5
pkgrel=2
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'granite' 'json-glib')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/bleakgrey/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('77b441df19b4d9f885b95510712f25b5e6719a27cdb527831e03212063df88d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}
