# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=dotacat
pkgver=0.1.1
pkgrel=1
pkgdesc="Like lolcat, but faster. Written in Rust"
arch=('x86_64')
url="https://git.scd31.com/stephen/dotacat"
license=('MIT')
makedepends=('cargo')
provides=('dotacat')
# conflicts=('dotacat-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e6475727566ade38dedd021ead4f3f1cb1cae09e673d320aa381fcfccd445d0')

build() {
    cd "$srcdir/dotacat"
    cargo build --release --locked
}

package() {
    cd "$srcdir/dotacat"
    
    install -Dm 755 "target/release/dotacat"  "$pkgdir/usr/bin/dotacat"
}
