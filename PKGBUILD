# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=vim-profiler
pkgver=0.0.4
pkgrel=1
pkgdesc="A vim profiling tool "
url="https://github.com/terror/$pkgname"
arch=("x86_64")
license=("custom:CC0-1.0")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('45122f40b7ac3f45b4c47800dbed08b6b42d7ded5fced9ca7d42d68c8afb528c')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/vp" "$pkgdir/usr/bin/vp"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
