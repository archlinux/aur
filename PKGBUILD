# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-spellcheck
pkgver=0.4.6
pkgrel=2
pkgdesc="Checks all your documentation for spelling mistakes"
url="https://github.com/drahnr/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "hunspell")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('a65c31830b3b5eda44f87c5051c8c08a86254c4507e1b42c0957f07bd86e3591')

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
