# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.1.3
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sleep-No-More/cpmenu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d0fb26c905879ea3f34086bdfa299cfc79460d10be032d26fc1dc81effa8cf0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/cpmenu "$pkgdir/usr/bin/cpmenu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
