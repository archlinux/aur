# Maintainer: Altair 
pkgname=kingler-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Kingler is a fork of krabby, it print the sprite of pokemon in the terminal + some info"
arch=('x86_64')
url="http://example.com"
license=('MIT')
source=("https://github.com/Luca-Barra/kingler/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/kingler-$pkgver"
    cargo build --release  # Build the project
}

package() {
    cd "$srcdir/kingler-$pkgver"
    install -Dm755 target/release/kingler "$pkgdir/usr/bin/kingler"  # Install the binary
    install -Dm644 README.md "$pkgdir/usr/share/doc/kingler/README.md"  
}

