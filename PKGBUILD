# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-flash
pkgver=0.12.0
pkgrel=1
pkgdesc="A cargo extension for programming microcontrollers"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('da4b319fb5d38399293f1aeccd7c90696c1417a42fb2f4b102e7c500bf37495a')

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
