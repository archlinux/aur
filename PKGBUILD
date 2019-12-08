# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.7.3
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('a9368e64a45e0153fe5ca75a44d9420719e096a21cb235351161590c5fcda4f4')

build() {
    arch-meson $pkgname-$pkgver build
    ninja -C build
}

# https://github.com/AravisProject/aravis/issues/320
#check() {
#    ninja test -C build
#}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
