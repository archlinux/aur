# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-flash
pkgver=0.8.0
pkgrel=1
pkgdesc="A cargo extension for programming microcontrollers"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f718165acb371f0a8f1e4799ea06a08427f4784d7fdad4fb9d48b44a3fbc9cd0')

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
