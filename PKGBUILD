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
sha256sums=('589122542ba801a47e1a1eccbdb882bbc785e15192416b2892649bd60cf692d1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
