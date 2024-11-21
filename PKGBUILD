# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=dunst-timer
pkgver=1.00.07
pkgrel=1
pkgdesc="A Python script for setting timers with progress bar notifications in Dunst"
arch=('any')
url="https://github.com/bitSheriff/dunst-timer"
license=('MIT')
depends=('python' 'dunst')
makedepends=('python' 'pyinstaller')
source=("https://github.com/bitSheriff/dunst-timer/archive/v$pkgver.tar.gz")
sha256sums=('61bd275f2896ed6c707a063af909bbb1ec714fc8c122d02192310f7eb67ca04b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile dunst-timer.py
}
package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dist/dunst-timer" "$pkgdir/usr/bin/dunst-timer"
}
