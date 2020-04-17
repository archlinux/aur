# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgver=0.5.13
pkgrel=1
arch=('x86_64')
url="https://github.com/mozilla/$pkgname"
license=('MPL2')
depends=('gcc')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('a8afee3d52ada16d72748d5edff92ab4eee982ccda183ba39a0e1041e13851f7')

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
