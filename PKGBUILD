# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-flash
pkgver=0.8.0
pkgrel=2
pkgdesc="A cargo extension for programming microcontrollers"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('32896d7a1162350b3b0dd82b83e181eb072b6e7c73dc959d98a0a573407352fb')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
