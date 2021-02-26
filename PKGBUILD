# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-feature
pkgver=0.5.0
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/Riey/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/Riey/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('4d69e891bab9ec885d76d7a829233c7363ad4c77f237e9665e0f0f038a92e2e7')

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
