# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=dunst-timer
pkgver=1.00.06
pkgrel=1
pkgdesc="A Python script for setting timers with progress bar notifications in Dunst"
arch=('any')
url="https://github.com/bitSheriff/dunst-timer"
license=('MIT')
depends=('python' 'dunst')
makedepends=('python' 'pyinstaller')
source=("https://github.com/bitSheriff/dunst-timer/archive/v$pkgver.tar.gz")
sha256sums=('b99e2da01abd1ff46f37e5680e5a35c3d7d0ea6c558c2d9d9ec0da93f9d992d2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile dunst-timer.py
}
package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/dunst-timer.py" "$pkgdir/usr/bin/dunst-timer"
    chmod +x "$pkgdir/usr/bin/dunst-timer"
}
