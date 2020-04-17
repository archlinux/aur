# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-deps
pkgver=1.4.1
pkgrel=1
pkgdesc="Cargo subcommand for building dependency graphs of Rust projects"
url="https://github.com/m-cat/$pkgname"
arch=("x86_64")
license=("BSD")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('85c3bb633b5569c40a712c1ef88d8025b3bb53ac90946ff80ebbfc5a1d324dc4')

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
