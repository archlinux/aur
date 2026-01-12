pkgname=gtk-meshtastic-client
pkgver=1.5
pkgrel=1
pkgdesc='An unofficial client for Meshtastic devices in GTK4/Libadwaita'
arch=(any)
url='https://gitlab.com/kop316/gtk-meshtastic-client'
license=(GPL-3.0-only)
depends=(
    gettext
    glib2
    gtk4
    libadwaita
    libshumate
    python
    python-meshtastic
    python-pypubsub
    python-pyqrcode
)
makedepends=(
    meson
)

source=("https://gitlab.com/kop316/gtk-meshtastic-client/-/archive/$pkgver/gtk-meshtastic-client-$pkgver.tar.bz2")
b2sums=('b558425f38ee9211e69c413fc6b0395fd26381ff6228aaf896492ef37c3e221d8d47b8b927168c1d6f7f825a55735e24e70a2bf87c8dcbdf0e8d1a3e0591cf6f')

build() {
    arch-meson "gtk-meshtastic-client-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
