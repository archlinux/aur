# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dstimer
pkgver=1.2.1
pkgrel=1
pkgdesc="The Timer for CLI people"
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dstimer"
license=('MIT')
makedepends=('rust' 'alsa-lib' 'pkgconf')
depends=('alsa-lib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dstimer/archive/v$pkgver.tar.gz")
sha256sums=('1d7a3a99ef8ed8a958a603d25159165815ddf56ff0aaef29fe91be7a2ea2c143')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/dstimer "$pkgdir/usr/bin/dstimer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
