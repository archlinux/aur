# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-spellcheck
pkgver=0.4.4
pkgrel=1
pkgdesc="Checks all your documentation for spelling mistakes"
url="https://github.com/drahnr/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "hunspell")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('8123ee40da99303bd3c90095a52b9b11b2eed3a941a337ec3b26fc3f5378d282')

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
