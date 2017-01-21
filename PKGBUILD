# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=xargo
pkgver=0.3.5
pkgrel=1
pkgdesc='Effortless cross compilation of Rust programs to custom bare-metal targets like ARM Cortex-M'
url="https://github.com/japaric/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rustup' 'gcc-libs-multilib')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('0c741b6d0aa27550fbbc64291574e4e78f48ed878879ff7a29f96175d9ec6380')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 target/release/xargo "$pkgdir/usr/bin"
}
