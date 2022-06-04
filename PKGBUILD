# Maintainer: talone <talone@boxph.one>
# co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.1.4
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'pipewire')
makedepends=('meson' 'gobject-introspection' 'rust' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('79302c047e486b1f3f96b9c5896a8c345e6f7cc15051ed09dbc80f451823b13a7ba8b4dc35a79b3f1706809a175d5e3b1b0d377d48a11cd79e8af80a35ab1f8b')

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
