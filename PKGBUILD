# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=xargo
pkgver=0.3.22
pkgrel=1
pkgdesc='Effortless cross compilation of Rust programs to custom bare-metal targets like ARM Cortex-M'
url="https://github.com/japaric/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rust' 'gcc-libs-multilib')
makedepends=('cargo')
source=("$url/archive/v$pkgver.zip")
sha256sums=('9aae905b7cd8df8e89f02c5d4a17f3191356f9446c5c05812d829ec92d2b619c')

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
