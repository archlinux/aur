# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=durthang-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern, terminal-based MUD client with TLS, GMCP, automap, aliases, triggers, and a sidebar panel system"
arch=('x86_64')
url="https://github.com/Pommersche92/durthang"
license=('GPL-3.0-only')
provides=('durthang')
conflicts=('durthang')
source=("https://github.com/Pommersche92/durthang/releases/download/v$pkgver/durthang-$pkgver-x86_64.tar.gz")
sha256sums=('930697ba98a700923f7476226fdfef5897a999bcadde9bdb152e324832081060')

package() {
    cd "durthang-$pkgver"
    install -Dm755 durthang "$pkgdir/usr/bin/durthang"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
