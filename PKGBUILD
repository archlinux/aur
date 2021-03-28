# Maintainer: Daniel Duan <daniel@duan.ca>
pkgname=tre-command
pkgver=0.3.6
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tree command, improved."
url="https://github.com/dduan/tre"
license=('MIT')
source=("https://github.com/dduan/tre/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c372573a6325288b9b23dcd20d1cb100ad275f5b0636a7328395352b3549dd71')

build() {
    cd $srcdir
    cargo build --release --locked --target-dir=$PWD/target
}

package() {
    cd $srcdir
    cargo test --release --locked --target-dir=$PWD/target
}

package() {
    cd $srcdir
    install -Dm 755 target/release/tre "${pkgdir}/usr/bin/tre"
}
