pkgname=pls-tools
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern successor of 'ls'"
arch=('x86_64')
url="https://github.com/saverioscagnoli/pls"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saverioscagnoli/pls/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ddc409bea09e6edafca68f152312c36e972c88a097a4391ebeaafe25c08bf8e')

build() {
    cd "pls-$pkgver"
    cargo build --release --locked
}


package() {
    cd "pls-$pkgver"
    install -Dm755 "target/release/pls" "$pkgdir/usr/bin/pls"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}