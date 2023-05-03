# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=dipc
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert your favorite images and wallpapers with your favorite color palettes/themes"
arch=('any')
url="https://github.com/doprz/dipc"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd98bf2eea8e97dfaeb8d4e0a991a732e35bf71e1b9bdf0045fdad80e0c0d319')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 -t "$pkgdir/usr/bin" target/release/dipc
}
