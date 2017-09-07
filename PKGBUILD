#Maintainer Gio d'Amelio <giodamelio@gmail.com>

pkgname=little_boxes
pkgdesc="Put boxes around stdin"
url="https://github.com/giodamelio/little_boxes"
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgver='1.6.0'
source=("https://github.com/giodamelio/little_boxes/archive/$pkgver.zip")
md5sums=('376d65ce883a37d0794d9a1386e489e2')
sha1sums=('7a9574a56e13178b952ed7d2edc79265cc96bf13')

build(){
    unzip -o $pkgver.zip
    cd "little_boxes-$pkgver"
    cargo build --release
}

package(){
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/little_boxes" "$pkgdir/usr/bin/little_boxes"
    install -Dm644 "$srcdir/$pkgname-$pkgver/little_boxes.1" "$pkgdir/usr/share/man/man1/little_boxes.1"
}

