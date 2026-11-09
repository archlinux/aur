# Maintainer: ddfabc <liqiang0330@gmail.com>
pkgname=abcclock
pkgver=2.1.0
pkgrel=1
pkgdesc="Hover desktop clock: analog dial, weekday, date, three timezones and weather (Qt5 on Linux, Qt6 on macOS)"
arch=('x86_64' 'aarch64')
url="https://github.com/abcabc0330/abcclock"
license=('MIT')
depends=('qt5-base' 'dbus' 'libxcb')
makedepends=('make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('115da1a910827aecd15f541e42819a06a34e0ba808fbb885b81193cb00cb161a')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 abcclock.pro PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 abcclock "$pkgdir/usr/bin/abcclock"
    install -Dm644 abcclock.desktop "$pkgdir/usr/share/applications/abcclock.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}