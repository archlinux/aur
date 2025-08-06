# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=dunst-timer
pkgver=1.00.08
pkgrel=1
pkgdesc="A Python script for setting timers with progress bar notifications in Dunst"
arch=('any')
url="https://github.com/bitSheriff/dunst-timer"
license=('MIT')
depends=(
    'python'
    'dunst'
)
makedepends=(
    'python'
    'pyinstaller'
    'python-altgraph'
)
source=("https://github.com/bitSheriff/dunst-timer/archive/v$pkgver.tar.gz")
sha256sums=('768a7043544a2afc02405af1bd40adaf42e3199e67152e4e9209e3bac5790429')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile dunst-timer.py
}
package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dist/dunst-timer" "$pkgdir/usr/bin/dunst-timer"
}
