# Maintainer: vodkanull <vodkanull@proton.me>
pkgname=nullwc
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal floating Wayland compositor"
arch=('x86_64')
url="https://github.com/vodkanull/nullwc"
license=('GPL-3.0-only')
depends=('wlroots0.19' 'libinput' 'libxkbcommon')
makedepends=('wayland' 'wayland-protocols' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vodkanull/nullwc/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "nullwc-main"
    make
}

package() {
    cd "nullwc-main"
    install -Dm755 nullwc "$pkgdir/usr/bin/nullwc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 wallpaper.jpg "$pkgdir/usr/share/$pkgname/wallpaper.jpg"
}
