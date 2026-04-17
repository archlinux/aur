# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware, Braille charts, per-char label inversion"
arch=('x86_64')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
provides=('narsil')
conflicts=('narsil')
source=("https://github.com/Pommersche92/narsil/releases/download/v$pkgver/narsil-$pkgver-x86_64.tar.gz")
sha256sums=('5b991bdd59e7a2f930bbd5cd9242a4a742205349cec76e192998982a225137e4')

package() {
    cd "narsil-$pkgver"
    install -Dm755 narsil "$pkgdir/usr/bin/narsil"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
