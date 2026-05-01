# Maintainer: Yumana <yumanuralfath2@gmail.com>
pkgname=radio-browser-zig
pkgver=0.0.1
pkgrel=1
pkgdesc="A native Zig client for the Radio Browser API"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Yumana/radio-browser"
license=('GPL3')
depends=('mpv')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/master.tar.gz")
sha256sums=('2c2d84220fbed2fbd784bac27ef7576a2a82bfbb38d97bd4273205a58afdfd61')

build() {
    cd "radio-browser"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "radio-browser"
    install -Dm755 "zig-out/bin/radio_browser" "$pkgdir/usr/bin/radio_browser"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
