# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

pkgname=myip-rs
pkgver=0.1.0
pkgrel=1
pkgdesc='A command-line tool to get your external IP address'
arch=('x86_64')
url='https://github.com/crabvk/myip'
license=('MIT')
makedepends=('cargo')
source=("https://github.com/crabvk/myip/archive/$pkgver.tar.gz")
sha512sums=('e9ea34abd8a380da5a188fcfa0352a938367e38bd731bc1356b112cff534a5934e1866eef8f83c40404f4e677c0d3c09fe06f520ffa9f0cbba96938f773e3298')

build() {
    cd myip-$pkgver
    cargo build --release --locked --target-dir=target
}

package() {
    cd myip-$pkgver
    install -Dm755 target/release/myip -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
