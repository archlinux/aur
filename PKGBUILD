# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=dotacat
pkgver=0.2.0
pkgrel=1
pkgdesc="Like lolcat, but faster. Written in Rust"
arch=('x86_64')
url="https://git.scd31.com/stephen/dotacat"
license=('MIT')
makedepends=('cargo')
provides=('dotacat')
# conflicts=('dotacat-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('724b6677f20bb1620ce7c240f07e7fb34f0fb7a57a0ff39518ce3754cb75e67b')

build() {
    cd "$srcdir/dotacat"
    cargo build --release --locked
}

package() {
    cd "$srcdir/dotacat"

    install -Dm 755 "target/release/dotacat"  "$pkgdir/usr/bin/dotacat"
    install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
