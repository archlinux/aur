# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=grits
pkgver=0.3.0
pkgrel=1
arch=("x86_64")
pkgdesc="Simple line-text formatter that makes it simple to parse/filter/format live logs"
url="https://github.com/solidiquis/$pkgname"
license=("MIT")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("09940b9815a468fe9f9251a96e68c6b42614bbcc82c844e391e04e5435ba188318ed66698c1a50b3e9bbae417a02457ee92b49f697f4a7a93d766b222e9d0e8c")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 target/release/grits "$pkgdir/usr/bin/grits"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
