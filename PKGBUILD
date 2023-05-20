# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.30.1
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.30.1/rtx-v1.30.1-linux-x64.tar.gz")
sha512sums=('928ee7c5e0a092b54db1de0318d24426dc7b4132bc545d7a11712eb0a0a77c13298a46c0b12bab9871d326ba194f6984048e3c89477f4bd88ca6a302abb391b6')

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
