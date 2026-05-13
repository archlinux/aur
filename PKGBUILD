# Maintainer: Cairn contributors
pkgname=cairn
pkgver=0.10.1
pkgrel=1
pkgdesc="A simple GNOME task manager"
arch=('any')
url="https://github.com/tanji/cairn"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'libnotify'
    'hicolor-icon-theme'
)
optdepends=(
    'libayatana-appindicator: system tray support'
)
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tanji/cairn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5007ae7134805f676b7137d05264efab949ab86c65409cfc6fb8a26d736fc28f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
