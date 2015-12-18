#Maintainer Gio d'Amelio <giodamelio@gmail.com>

pkgname=little_boxes
pkgdesc="Put boxes around stdin"
url="https://github.com/giodamelio/little_boxes"
pkgrel=2
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgver='1.0.1'
source=("https://github.com/giodamelio/little_boxes/archive/$pkgver.zip")
sha1sums=("2322f84a81c138241994f96fd3a1a57370ca679e")

build(){
    unzip -o $pkgver.zip
    cd "little_boxes-$pkgver"
    cargo build --release
}

package(){
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/little_boxes" "$pkgdir/usr/bin/little_boxes"
}

