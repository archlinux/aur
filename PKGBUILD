# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=microserver
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple ad-hoc server with SPA support based on Warp!. Excellent for testing React, Angular, Vue apps and the like."
url="https://github.com/robertohuertasm/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('24832a4cbf0d314a84c7c0c5acaedaf7cd5ba7e58c2a6fbe5336190eb2a39113')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
