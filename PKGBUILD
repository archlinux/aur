# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature
pkgver=0.5.1
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/Riey/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('da566cf8677851e0647803a6e43507a414c87ffdd38dc9587b0634529a8ae060')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
