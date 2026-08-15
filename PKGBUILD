# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dstimer
pkgver=1.2.0
pkgrel=1
pkgdesc="The Timer for CLI people"
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dstimer"
license=('MIT')
makedepends=('rust' 'alsa-lib' 'pkgconf')
depends=('alsa-lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dstimer/archive/v$pkgver.tar.gz")
sha256sums=('63c22b021deae8de6f15c5bd019f7c9de0351f1ffbe830f29d8aeb9ee5e586dc')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/dstimer "$pkgdir/usr/bin/dstimer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
