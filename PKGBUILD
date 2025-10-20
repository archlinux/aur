# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
makedepends=('rust' 'cargo')
source=("git+https://github.com/Sleep-No-More/cpmenu.git#tag=${pkgver}")
sha256sums=('f21f44ea9f10a79f7b5167a6d1271d8fab02bffd374ab77507bd535e950a8463')

build() {
    cd cpmenu
    cargo build --release --locked
}

package() {
    cd cpmenu
    install -Dm755 "target/release/cpmenu" "$pkgdir/usr/bin/cpmenu"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
