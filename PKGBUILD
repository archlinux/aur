# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-deps
pkgver=1.5.0
pkgrel=1
pkgdesc="Cargo subcommand for building dependency graphs of Rust projects"
url="https://github.com/m-cat/$pkgname"
arch=("x86_64")
license=("BSD")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('1dd7ae9f245cc146fdfdc539d3d387926f3fc1d31e36aabd528be16c87e03ee8')

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
