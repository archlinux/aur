# Maintainer: Danny Rosenthal <dsrosen6@gmail.com>
pkgname=hyprdocked
pkgver=0.3.0
pkgrel=1
pkgdesc="Laptop display helper for Hyprland"
arch=("x86_64" "aarch64")
url="https://github.com/dsrosen6/hyprdocked"
license=("MIT")
depends=("hyprland")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("661515c0b2846aaa62717f00842e16a63902d4ca3f677cf64d5e22f578b1f075")

build() {
    cd "$pkgname-$pkgver"
    go build -o hyprdocked .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hyprdocked "$pkgdir/usr/bin/hyprdocked"
    install -Dm644 systemd/hyprdocked.service \
        "$pkgdir/usr/lib/systemd/user/hyprdocked.service"
}
