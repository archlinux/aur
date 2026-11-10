# Maintainer: ddfabc <liqiang0330@gmail.com>
pkgname=abcclock
pkgver=3.0.0
pkgrel=1
pkgdesc="Hover desktop clock: analog dial, weekday, date, three timezones and weather (Qt6; native Wayland layer-shell, X11 fallback)"
arch=('x86_64' 'aarch64')
url="https://github.com/abcabc0330/abcclock"
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'dbus' 'libxcb')
makedepends=('make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25ce0419ae26f9749e89dd7f32b2167028b2d50eb3d8e26c9152b7395d98c482')

build() {
    cd "$pkgname-$pkgver"
    qmake6 abcclock.pro PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 abcclock "$pkgdir/usr/bin/abcclock"
    install -Dm644 abcclock.desktop "$pkgdir/usr/share/applications/abcclock.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}