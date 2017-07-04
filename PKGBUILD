#Maintainer Gio d'Amelio <giodamelio@gmail.com>

pkgname=little_boxes
pkgdesc="Put boxes around stdin"
url="https://github.com/giodamelio/little_boxes"
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgver='1.3.0'
source=("https://github.com/giodamelio/little_boxes/archive/$pkgver.zip")
md5sums=('0a8e85a26e6cb2447c36fb6434a59e57')
sha1sums=('648877d9ebcc652357e434b38b5fbc3cdf0697b0')

build(){
    unzip -o $pkgver.zip
    cd "little_boxes-$pkgver"
    cargo build --release
}

package(){
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/little_boxes" "$pkgdir/usr/bin/little_boxes"
    install -Dm644 "$srcdir/$pkgname-$pkgver/little_boxes.1" "$pkgdir/usr/share/man/man1/little_boxes.1"
}

