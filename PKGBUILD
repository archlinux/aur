# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=dunst-timer
pkgver=1.00.05
pkgrel=1
pkgdesc="A Python script for setting timers with progress bar notifications in Dunst"
arch=('any')
url="https://github.com/bitSheriff/dunst-timer"
license=('MIT')
depends=('python' 'dunst')
makedepends=('python' 'pyinstaller')
source=("https://github.com/bitSheriff/dunst-timer/archive/v$pkgver.tar.gz")
sha256sums=('3fd9cedc900332904dcd265a866326e4f01dfa1f2e901f8565edbc7037c1a08d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile dunst-timer.py
}
package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dunst-timer.py" "$pkgdir/usr/bin/dunst-timer"
    chmod +x "$pkgdir/usr/bin/dunst-timer"
}
