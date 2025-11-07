# Maintainer: r3dg0d
pkgname=vidocq-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Advanced OSINT tool for username searching across 450+ platforms"
arch=('x86_64')
url="https://github.com/r3dg0d/vidocq"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("https://github.com/r3dg0d/vidocq/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/vidocq-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/vidocq-${pkgver}"
    install -Dm755 target/release/vidocq "$pkgdir/usr/bin/vidocq"
    install -Dm644 README.md "$pkgdir/usr/share/doc/vidocq/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vidocq/LICENSE"
}

