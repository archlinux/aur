# Maintainer: execrooted <execrooted@gmail.com>

pkgname=droplet
pkgver=0.1.1
pkgrel=1
pkgdesc="A colorful terminal weather animation tool written in Rust (rain and snow effects)"
arch=('x86_64')
url="https://github.com/execrooted/droplet"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

