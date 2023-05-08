# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.29.6
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.29.6/rtx-v1.29.6-linux-x64.tar.gz")
sha512sums=('be7f905939c70677e40b23f9b4a7465edba68ef7dff3c7f9f4a474c4068a49090e544ef79e83a39dab867e7ca22a0e5264b38cf9add3663093581a16b5fa6806')

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
