# Maintainer: ddfabc <liqiang0330@gmail.com>
pkgname=abcclock
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt5 hover desktop clock: analog dial, weekday, date, three city timezones and weather"
arch=('x86_64' 'aarch64')
url="https://github.com/abcabc0330/abcclock"
license=('MIT')
depends=('qt5-base')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('499cafd8a72cb99ab1a786d80f1c44aa610fa76a5c9e3a2346b4e1e30a2cd997')

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