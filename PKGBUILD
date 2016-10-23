# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=xargo
pkgver=0.2.1
pkgrel=1
pkgdesc='Effortless cross compilation of Rust programs to custom bare-metal targets like ARM Cortex-M'
url="https://github.com/japaric/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rustup' 'gcc-libs-multilib')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('52c03dce2f4389548460bdbeff688337e5263e1faf6dfb176b2ab59c086278b4')

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
