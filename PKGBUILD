# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil-nvidia-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware (NVIDIA), Braille charts, per-char label inversion"
arch=('x86_64')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
provides=('narsil')
conflicts=('narsil' 'narsil-bin' 'narsil-nvidia')
source=("https://github.com/Pommersche92/narsil/releases/download/v$pkgver/narsil-nvidia-$pkgver-x86_64.tar.gz")
sha256sums=('a844d09032c59e6f909013cd53a8b50cf9548e0769a2935e06a15a7269ee4d1e')

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
