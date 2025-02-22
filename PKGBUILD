# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=podzol
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern package manager for Minecraft modpacks"
arch=('x86_64' 'aarch64')
url="https://github.com/morr0ne/podzol"
license=('Apache-2.0')
depends=("zstd")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/morr0ne/podzol/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/podzol "${pkgdir}/usr/bin/podzol"
}
