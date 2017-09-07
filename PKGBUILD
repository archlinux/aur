#Maintainer Gio d'Amelio <giodamelio@gmail.com>

pkgname=little_boxes
pkgdesc="Put boxes around stdin"
url="https://github.com/giodamelio/little_boxes"
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgver='1.5.0'
source=("https://github.com/giodamelio/little_boxes/archive/$pkgver.zip")
md5sums=('2f416a4d6e8a49f70d963802724dd650')
sha1sums=('e964c3c395012d38c5f3f11f6b0476f9626a5d25')

build(){
    unzip -o $pkgver.zip
    cd "little_boxes-$pkgver"
    cargo build --release
}

package(){
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/little_boxes" "$pkgdir/usr/bin/little_boxes"
    install -Dm644 "$srcdir/$pkgname-$pkgver/little_boxes.1" "$pkgdir/usr/share/man/man1/little_boxes.1"
}

