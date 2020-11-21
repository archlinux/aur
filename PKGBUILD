# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-spellcheck
pkgver=0.5.0
pkgrel=2
pkgdesc="Checks all your documentation for spelling mistakes"
url="https://github.com/drahnr/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "hunspell")
makedepends=("clang")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('91207cf907ff7a7620b7ede396965cefb8615a557f78949243885032f46e9e58')

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
