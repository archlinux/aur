# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-flash
pkgver=0.10.1
pkgrel=1
pkgdesc="A cargo extension for programming microcontrollers"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('06164763ff5ee8519a7691270ef0af4ac694a744d50e6b2c72d473520c73847e')

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
