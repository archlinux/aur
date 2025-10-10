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
sha256sums=('8c5a5017f762239aa4463a176a0028179022b7a45fdff2b072628de70ef3a390')

build() {
    cd "raindrops-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "raindrops-${pkgver}"
    install -Dm755 target/release/raindrops "$pkgdir/usr/bin/raindrops"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

