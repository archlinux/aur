# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil-nvidia-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware (NVIDIA), Braille charts, per-char label inversion"
arch=('x86_64')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
provides=('narsil')
conflicts=('narsil' 'narsil-bin' 'narsil-nvidia')
source=("https://github.com/Pommersche92/narsil/releases/download/v$pkgver/narsil-nvidia-$pkgver-x86_64.tar.gz")
sha256sums=('c55e388a1c08daffdf8204a6bc2272f1a6570ab7f07c406f2c8d1f5579e3f32c')

package() {
    cd "narsil-nvidia-$pkgver"
    install -Dm755 narsil "$pkgdir/usr/bin/narsil"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
