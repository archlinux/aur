# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature
pkgver=0.5.3
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/Riey/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('8efb2bed3941cfaadf5616fc4c4f7f10ef775a40bbe745d02afe0f37b08dd38e')

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
