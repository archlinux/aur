# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgver=0.6.0
pkgrel=1
arch=('x86_64')
url="https://github.com/mozilla/$pkgname"
license=('MPL2')
depends=('gcc')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('a2979ca9be858c93027af2c2cb12bba92f75996b661224059da8f500d2688879')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 target/release/grcov "$pkgdir/usr/bin"
}
