# Maintainer: talone <talone@boxph.one>
# co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.1.1
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('meson' 'gobject-introspection' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('331455c741f5d2b8186078f98405077a28d983b62e4cb58862f4a64eafc9e9de88668951b56b14666d84f5ed768d4cbc373a81c734c553b538c7f8c938574ee7')

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
