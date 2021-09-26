# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=xargo
pkgver=0.3.24
pkgrel=1
pkgdesc='Effortless cross compilation of Rust programs to custom bare-metal targets like ARM Cortex-M'
url="https://github.com/japaric/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rust' 'gcc-libs-multilib')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('68ca5c3c5576fa75f53ac3ca98632f504d1f174ae31282114571e6d889c91a0a')

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
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
