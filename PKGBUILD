# Maintainer: Ben Davison <benjdavison02@gmail.com>
pkgname=gtkittorrent
pkgver=0.4.0
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
sha256sums=('1ee3fffd9c615e1fd825f298c4d025afd2bdc0ffd052ab758943e1414d69b828')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
