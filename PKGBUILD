# Maintainer: Rotstein
pkgname=memory-game
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun memory game, written in C++."
arch=('x86_64')
url="https://github.com/rotstein007/Memory"  # Aktualisiert auf Ihren GitHub-Link
license=('MIT')
depends=('gtk4' 'gcc')  # Abhängigkeiten
source=("git+https://github.com/rotstein007/Memory.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Memory"
    mkdir -p build
    cd build
    cmake ..  # cmake Optionen
    make
}

package() {
    cd "$srcdir/Memory/build"  # Korrigiertes Verzeichnis
    install -Dm755 Memory "$pkgdir/usr/bin/Memory"  # Installation der ausführbaren Datei
    install -Dm644 ../MemoryGame.desktop "$pkgdir/usr/share/applications/MemoryGame.desktop"
    install -Dm644 ../img/img.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/MemoryGame.png"
}