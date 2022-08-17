# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=jaq
pkgver=0.8.0
pkgrel=1
pkgdesc="jaq is a clone of the JSON data processing tool jq. jaq aims to support a large subset of jq's syntax and operations."
url="https://github.com/01mf02/$pkgname"
arch=("x86_64")
license=("BSD")
makedepends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('2782e1b700d9600a6b5f0622441371a6ed2843298c102397cac2e8a1d2cddb18')

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
