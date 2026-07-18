# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=pazi
pkgver=0.5.0
pkgrel=2
pkgdesc="An autojump 'zap to directory' helper"
url="https://github.com/euank/pazi"
arch=("x86_64")
license=("GPL-3.0-only")
depends=("glibc" "libgcc")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/euank/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ef6c3862b2b4961ead9956d36bc5eff455dd47e3ec69e7aa78dde997d4871d8394ecd0e30d380904828198efdb6ed5e114d7025c31be80ac659366526de1c4ce')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 "packaging/man/pazi.1" "$pkgdir/usr/share/man/man1/pazi.1"
}
