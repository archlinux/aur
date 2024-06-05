# Maintainer: MD Gaziur Rahman Noor <mdgaziurrahmannoor@gmail.com>
pkgname=findex-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Highly customizable application finder with high performance. Written in Rust and uses GTK"
url="https://github.com/mdgaziur/findex"
license=("GPL3")
arch=("x86_64")
provides=("findex")
conflicts=("findex")
source=("https://github.com/mdgaziur/findex/releases/download/v$pkgver/findex-$pkgver-x86_64.tar.gz")
sha256sums=('0804003de3e397d1a28e6fb8452b610a693e0a81dc2418b85311d08675d46219')
install=post_install.install
depends=("gtk3" "libkeybinder3")

package() {
    cd "$srcdir/findex-$pkgver-x86_64"
    install -Dm755 findex -t "$pkgdir/usr/bin"
    install -Dm755 findex-daemon -t "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/opt/findex"
    cp style.css "$pkgdir/opt/findex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/findex/LICENSE"
}
