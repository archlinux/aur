# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=jaq
pkgver=0.6.0
pkgrel=1
pkgdesc="jaq is a clone of the JSON data processing tool jq. jaq aims to support a large subset of jq's syntax and operations."
url="https://github.com/01mf02/$pkgname"
arch=("x86_64")
license=("BSD")
makedepends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('aebeabacdd1571bd650e628c424a17ca92744a7b1f8b587059eb0a7ba7668987')

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
