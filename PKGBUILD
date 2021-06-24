# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-embed
pkgver=0.11.0
pkgrel=1
pkgdesc="A utility to develop software for embedded ARM and RISC-V cores"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('e922e75a9cecd0b4a432dc289be6377fe42d0b6d43880e52983cc799551bb8ea')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
