pkgname=raindrops
pkgver=1.0.0
pkgrel=1
pkgdesc="An aesthetic rain CLI program written in Rust"
arch=('x86_64')
url="https://github.com/execRooted/raindrops.git"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("raindrops-${pkgver}.tar.gz")
sha256sums=('85cea451eec057fa7e734548ca3ba6d779ed5836a3f9de14b8394575ef0d7d8e')

build() {
    cd "raindrops-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "raindrops-${pkgver}"
    install -Dm755 target/release/raindrops "$pkgdir/usr/bin/raindrops"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

