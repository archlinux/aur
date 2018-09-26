# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.0.0
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c6ea74975ee388d57dc8a309bb3eb066d665462d675f13d7e8614f2902b7ddbf6b473236239767783ca054c02be048bb4aefc9823313f9dfb3cc748a195a717a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --features i3
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
