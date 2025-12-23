# Maintainer: Sergey Desyatkov <sergeydesyatkov@proton.me>

pkgname=remora-ssh
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple SSH manager with TUI "
arch=('x86_64')
url="https://github.com/desyatkoff/$pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('568b4acee79447df12821d080551bcd5acd460aefded2c643966b7b0e75437c8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
