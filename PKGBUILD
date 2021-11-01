# Maintainer: Gyara <laxect39@gmail.com>

pkgname=mdzk
pkgver=0.4.3
pkgrel=1
pkgdesc="Plain text Zettelkasten based on mdBook"
url="https://github.com/mdzk-rs/$pkgname"
arch=("x86_64")
license=("MPL2")
makedepends=("cargo")
source=(https://github.com/mdzk-rs/${pkgname}/archive/${pkgver//_/-}.tar.gz)
b2sums=('4a964452b31adc03b8b030916e3ea7682c8a9f9e8d0fc14c622a3e83828bec9d33cd722b8f45f30a01bf6e4f2a4e09fbce29ad5fcabb6165a88ba69629e7ecb1')

build()
{
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
