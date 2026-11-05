# Maintainer: Ben Davison <benjdavison02@gmail.com>
pkgname=gtkittorrent
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern GTK4 and Libadwaita frontend for qBittorrent"
arch=('any')
url="https://github.com/BenBJD/gtkittorrent"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'libadwaita'
    'python'
    'python-gobject'
    'python-qbittorrent-api'
)
optdepends=(
    'qbittorrent-nox: Recommended headless qBittorrent for local instances'
    'qbittorrent: Desktop application fallback for local instances'
)
makedepends=(
    'meson'
    'ninja'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('b6f1695baccff23b6cb43c617ad570875165a95481b8b7c89ca1676b6001720d')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
