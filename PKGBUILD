pkgname=gtk-meshtastic-client
pkgver=1.4
pkgrel=1
pkgdesc='An unofficial client for Meshtastic devices in GTK4/Libadwaita'
arch=(any)
url='https://gitlab.com/kop316/gtk-meshtastic-client'
license=(GPL-3.0-only)
depends=(
    libshumate
    python
    python-meshtastic
    python-pyqrcode
)
optdepends=(
)
makedepends=(
)

source=("https://gitlab.com/kop316/gtk-meshtastic-client/-/archive/$pkgver/gtk-meshtastic-client-$pkgver.tar.bz2")
b2sums=('1a56876e1f1e3a9eecf4d277ade44ef4b48d1e1e1a4ef8d967cb5db08e77db3e1bba47d58d3009c1c7519e6eea8f3028df6a0488cf284d610c15241ad9060bd7')

build() {
    arch-meson "gtk-meshtastic-client-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
