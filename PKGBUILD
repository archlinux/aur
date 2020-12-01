# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-brief
pkgver=0.1.0
pkgrel=1
pkgdesc="Display a brief summary of cargo dependencies."
url="https://github.com/sanpii/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('1d8850f4018f3be245474b0197f627262dfdce69c1c012ca76abf2364599cc6e')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
