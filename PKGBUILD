# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware, Braille charts, per-char label inversion"
arch=('x86_64')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
provides=('narsil')
conflicts=('narsil')
source=("https://github.com/Pommersche92/narsil/releases/download/v$pkgver/narsil-$pkgver-x86_64.tar.gz")
sha256sums=('d53727f2ebe1fb74e94d379fe0a8cca706f7737629fe328ef6996432fa269e44')

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
