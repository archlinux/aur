# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature
pkgver=0.5.4
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/Riey/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('6774ce2454d669d96857a9b00a87758b6affce363e59a2ea5dc152f9c9c32a95')

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
