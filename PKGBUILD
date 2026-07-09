# Maintainer: 1337hero
pkgname=yeet-launcher
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast, minimal, configurable app launcher for Wayland"
arch=('x86_64')
url="https://github.com/1337hero/yeet"
license=('GPL3')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
provides=('yeet')
conflicts=('yeet' 'yeet-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1337hero/yeet/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3d13ef0ea4840087563b1c3ec0f718c6ec7acbd5c36563ca2eb2f1ef2071628')

build() {
    cd "yeet-$pkgver"
    cargo build --release --locked
}

package() {
    cd "yeet-$pkgver"
    install -Dm755 "target/release/yeet" "$pkgdir/usr/bin/yeet"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
