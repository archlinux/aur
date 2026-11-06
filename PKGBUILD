# Maintainer: ddfabc <liqiang0330@gmail.com>
pkgname=abcclock
pkgver=1.1.0
pkgrel=1
pkgdesc="Qt5 hover desktop clock: analog dial, weekday, date, three city timezones and weather"
arch=('x86_64' 'aarch64')
url="https://github.com/abcabc0330/abcclock"
license=('MIT')
depends=('qt5-base')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('521375740e7aa6157a45d08a15f019e765a0d248e4a443a4877978fed040e0f7')

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