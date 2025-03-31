pkgname=nightscape
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based night sky simulation with stars, moon, and rare events like comets and UFOs."
arch=('x86_64')
url="https://github.com/xhon4/nightscape"
license=('MIT')
depends=('rust' 'signal-hook' 'crossterm')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
