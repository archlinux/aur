# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-spellcheck
pkgver=0.3.0
pkgrel=1
pkgdesc="Checks all your documentation for spelling mistakes"
url="https://github.com/drahnr/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "hunspell")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('3faadd8b8410e0c2bc5e0c8fe0a9c783dc522f12e1c9ce5bb934c214b1dc75d4')

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
