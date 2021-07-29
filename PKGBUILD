# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=vim-profiler
pkgver=0.0.3
pkgrel=1
pkgdesc="A vim profiling tool "
url="https://github.com/terror/$pkgname"
arch=("x86_64")
license=("custom:CC0-1.0")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('c259617ef6b9e874e8576b1d743c259558ae6e371634d5148bd0db98bb20d330')

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
