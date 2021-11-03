# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgver=0.8.4
pkgrel=1
arch=('x86_64')
url="https://github.com/mozilla/$pkgname"
license=('MPL2')
depends=('gcc')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('0e286b308a051cf6c6a8a84b3afe405ae755fe50df62f8fdbe6813a73b076446')

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
