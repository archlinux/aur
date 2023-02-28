# Maintainer: MD Gaziur Rahman Noor <mdgaziurrahmannoor@gmail.com>
pkgname=findex-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Highly customizable application finder with high performance. Written in Rust and uses GTK"
url="https://github.com/mdgaziur/findex"
license=("GPL3")
arch=("x86_64")
provides=("findex")
conflicts=("findex" "findex-git")
source=("https://github.com/mdgaziur/findex/releases/download/v$pkgver/findex-$pkgver-x86_64.tar.gz")
sha256sums=('9c76ae501e14da4795bb4d2c0841fd227a0d8ca1884ed7b7e2203b0bb0b6c6da')
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
