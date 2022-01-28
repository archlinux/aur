# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgver=0.8.6
pkgrel=1
arch=('x86_64')
url="https://github.com/mozilla/$pkgname"
license=('MPL2')
depends=('gcc')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('734b2d53ff1c2b1549da786c6dc0ebc6998b80337061c9428a7b972ece93b634')

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
