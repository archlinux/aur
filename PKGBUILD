# Maintainer: You <name at domain dot com>
# Contributor: Someone Else <email>

pkgname=time-rs-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal Catppuccin-themed terminal countdown timer"
arch=('x86_64')
url="https://github.com/ryu-ryuk/yoru-timer-cli"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/time-rs-cli" "$pkgdir/usr/bin/time-rs-cli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
