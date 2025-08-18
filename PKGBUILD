# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=ting
pkgver=0.1.0
pkgrel=1
pkgdesc="Audio feedback on the command line"
arch=("x86_64")
url="https://github.com/dhth/ting"
license=("MIT")
makedepends=("rust")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4eee508958d9e1190e4dfc330d9a7e53b4a69839b35dc43855126781ab5ffa3')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
