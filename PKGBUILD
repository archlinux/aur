# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=jaq
pkgver=0.7.0
pkgrel=1
pkgdesc="jaq is a clone of the JSON data processing tool jq. jaq aims to support a large subset of jq's syntax and operations."
url="https://github.com/01mf02/$pkgname"
arch=("x86_64")
license=("BSD")
makedepends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('b0aebabdc99fed46c3f75d68f832fe6b8d5c9cbe4bedea1b3011f5102fcf233f')

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
