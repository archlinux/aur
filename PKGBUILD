# Maintainer: chrontax
pkgname=comiconv
pkgver=0.1.2
pkgrel=1
makedepends=('rust' 'cargo' 'nasm')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A command line tool to convert comic book archives to other formats."
url="https://github.com/chrontax/comiconv"
source=("$pkgname::git+https://github.com/chrontax/comiconv")
license=('GPL-2.0')
sha512sums=(SKIP)

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/comiconv "$pkgdir/usr/bin/comiconv"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
