# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=microserver
pkgver=0.1.7
pkgrel=1
pkgdesc="Simple ad-hoc server with SPA support based on Warp!. Excellent for testing React, Angular, Vue apps and the like."
url="https://github.com/robertohuertasm/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('bf1b831548b9ed2b9588bcd8919d3228d79e7113c606d6f32528d53f37544e71')

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
