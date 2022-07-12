# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-embed
pkgver=0.13.0
pkgrel=1
pkgdesc="A utility to develop software for embedded ARM and RISC-V cores"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('3c75d357cb84ffaa83c531121941afde859cf9727ec0911fd584f90b40cf1d2b')

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
