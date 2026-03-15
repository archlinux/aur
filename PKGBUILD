# Maintainer: Rezyys
pkgname=ccraw
pkgver=0.1.0
pkgrel=1
pkgdesc="crows in the terminal"
arch=('x86_64')
url="https://github.com/Jenyyk/ccraw"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jenyyk/ccraw/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79dc5fc2fbb70eb7ab8d9fb56ffdf2af751e0bf0c3d1dec96ae58a8da63b4d50')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
