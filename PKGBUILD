# Maintainer: talone <talone@boxph.one>
 
pkgname="authenticator"
pkgver=4.0.3
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('gtk4' 'glib2' 'zbar' 'gdk-pixbuf2' 'gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-bad' 'gst-plugins-bad-libs' 'libadwaita-git')
makedepends=('rust' 'meson' 'ninja' 'gobject-introspection' 'git')
source=("$pkgname::git+https://gitlab.gnome.org/World/Authenticator.git?unsigned#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    arch-meson $pkgname build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
