# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgver=0.8.5
pkgrel=1
arch=('x86_64')
url="https://github.com/mozilla/$pkgname"
license=('MPL2')
depends=('gcc')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('34d9701c04fe74c35c3e34d6f8210be4063c30496ddf85b064b1d6612f7c0906')

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
