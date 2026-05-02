# Maintainer: Arsenii Sahalianov <aywski@gmail.com>
pkgname=orbitty
pkgver=0.1
pkgrel=1
pkgdesc="Terminal idle screensaver with spinning planets"
arch=('x86_64' 'aarch64')
url="https://github.com/aywski/orbitty"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef4183b7ab95fc3f243e811684577b8f1143684924a2415f26c3ea0d438071f3')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/orbitty" "$pkgdir/usr/bin/orbitty"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
