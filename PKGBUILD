# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics
pkgver=0.5.6
pkgrel=1
pkgdesc="Wayland-native lyrics display for MPD with online fallback"
arch=('x86_64')
url="https://github.com/unstable-code/lyrics"
license=('GPL-3.0-or-later')
depends=('wayland' 'cairo' 'pango' 'curl' 'fontconfig' 'openssl' 'libappindicator-gtk3' 'gdk-pixbuf2' 'playerctl')
optdepends=('snixembed: System tray support for Swaybar')
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "lyrics-$pkgver"
    meson setup build --prefix=/usr
    meson compile -C build
}

package() {
    cd "lyrics-$pkgver"
    meson install -C build --destdir="$pkgdir"
}
