# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.30.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.30.0/rtx-v1.30.0-linux-x64.tar.gz")
sha512sums=('c76bb1e99fa1fb6499808ee3707f34e60329ec030d05bef30363968acd3b5cf38bfbe9f1caa29c289eb6c2ff150d03bbe4e045f5aff414c94a924b03633a7617')

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
