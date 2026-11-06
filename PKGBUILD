# Maintainer: ddfabc <liqiang0330@gmail.com>
pkgname=abcclock
pkgver=1.4.3
pkgrel=1
pkgdesc="Qt5 hover desktop clock: analog dial, weekday, date, three city timezones and weather"
arch=('x86_64' 'aarch64')
url="https://github.com/abcabc0330/abcclock"
license=('MIT')
depends=('qt5-base' 'dbus')
makedepends=('make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72bf05776fd7bf5788abe57ea3e2a673cf15cd25c49c81787c2b086ad11fc6cb')

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