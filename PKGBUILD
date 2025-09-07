# Maintainer: Cleboost <coil-evict-corsage@duck.com>
pkgname=waifu-generator
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK 4 application developed in Rust for generating waifus"
arch=('x86_64')
url="https://github.com/cleboost/waifu-generator"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cleboost/waifu-generator/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Waifu-Generator-$pkgver"
    cargo build --release
}

package() {
    cd "Waifu-Generator-$pkgver"
    install -Dm755 target/release/waifu-generator "$pkgdir/usr/bin/waifu-generator"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
