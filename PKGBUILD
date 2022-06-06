# Maintainer: talone <talone@boxph.one>
# co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.1.5
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'pipewire')
makedepends=('meson' 'gobject-introspection' 'rust' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('4d7849ee05763ac4a24a9faf8c39917b870cb56f8ab45ca91abcefa4e86e7e929fae107ef5112aa0d3de98cb18a3607ba66a3ff8404ddde294880890045ad2af')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
