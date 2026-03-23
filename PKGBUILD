# Maintainer: Rezyys
pkgname=ccraw
pkgver=0.2.1
pkgrel=1
pkgdesc="crows in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Jenyyk/ccraw"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 ccraw.1 "$pkgdir/usr/share/man/man1/ccraw.1"
}
