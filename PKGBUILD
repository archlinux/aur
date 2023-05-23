# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.30.4
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.30.4/rtx-v1.30.4-linux-x64.tar.gz")
sha512sums=('6212fd4b4e0c73af3ed0e6ee263a0d05b1800ef3812bcee498bd58280866dde86e7439c6a4de67b82a770c61d7222dcd824abfc983776d58c6018d455b3a16ee')

prepare() {
    tar -xzf rtx-$pkgver.tar.gz
}

package() {
    cd "$srcdir/"
    install -Dm755 rtx/bin/rtx "$pkgdir/usr/bin/rtx"
    install -Dm644 rtx/man/man1/rtx.1 "$pkgdir/usr/share/man/man1/rtx.1"
}

check() {
    "$srcdir/rtx/bin/rtx" --version
}
