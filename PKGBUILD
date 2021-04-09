# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature
pkgver=0.5.2
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/Riey/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('6a51d14346dc8e5184a1ddf716fc2287512b36719ed42e92c76a7d2d7c6c2ef2')

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
