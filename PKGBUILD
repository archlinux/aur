# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=microserver
pkgver=0.1.8
pkgrel=2
pkgdesc="Simple ad-hoc server with SPA support based on Warp!. Excellent for testing React, Angular, Vue apps and the like."
url="https://github.com/robertohuertasm/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('56163f69ec541707a6c917f1b5961be9c715c81de92dc5bb9fb9695e29bcc236')

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
