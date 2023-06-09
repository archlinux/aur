# Maintainer: Eric Sandoval <esandovalruezga@gmail.com>
# Contributor: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.10.1
pkgrel=1
pkgdesc='xautolock rewrite in Rust, with a few extra features (fork)'
url='https://github.com/realSaltyFish/xidlehook'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('rust' 'libxss' 'python')
optdepends=()
depends=('libpulse')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f2d5d400031a1a4aeeb6950fd04ff51350628153ec9c4d74d9d9f1070e827cb5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$pkgname"{,-client}
}
