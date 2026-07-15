# Maintainer: Dimitrios Mistriotis <dimitrismistriotis@gmail.com>
pkgname=yes_or_no
pkgver=0.1.0
pkgrel=1
pkgdesc="A drop-in replacement to \"yes\" utility which allows alternative answers based on probability"
arch=('x86_64')
url="https://github.com/dimitrismistriotis/yes_or_no"
license=('MIT' 'Apache-2.0')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimitrismistriotis/yes_or_no/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69d2fb67f2d67fc5f24811515faa56f880249ddf97bccc0d381fde4635785ac6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/yes_or_no" "$pkgdir/usr/bin/yes_or_no"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
