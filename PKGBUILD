#Maintainer Gio d'Amelio <giodamelio@gmail.com>

pkgname=little_boxes
pkgdesc="Put boxes around stdin"
url="https://github.com/giodamelio/little_boxes"
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgver='1.1.0'
source=("https://github.com/giodamelio/little_boxes/archive/$pkgver.zip")
sha1sums=("b2522e46b690e17a2712641c492f3def996053d3")

build(){
    unzip -o $pkgver.zip
    cd "little_boxes-$pkgver"
    cargo build --release
}

package(){
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/little_boxes" "$pkgdir/usr/bin/little_boxes"
}

