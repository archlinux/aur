# Maintainer: Tom BH <tom@tombh.co.uk>
pkgname=rtx-bin
pkgver=1.29.3
pkgrel=1
pkgdesc='Runtime Executor (asdf rust clone)'
url='https://github.com/jdxcode/rtx'
source_x86_64=("https://github.com/jdxcode/rtx/releases/download/v${pkgver}/rtx-v${pkgver}-linux-x64.tar.gz")
arch=('x86_64')
license=('MIT')
conflicts=('rtx-git')
provides=('rtx')
sha256sums_x86_64=('940b168c9eca301aaf280f417ed86e94af1a5ede6adffb86d5da3fb2fcb0c5c8')

prepare() {
  tar -xzf rtx-v$pkgver-linux-x64.tar.gz
}

package() {
    cd "$srcdir"
    install -Dm755 rtx/bin/rtx "$pkgdir/usr/bin/rtx"
    install -Dm644 rtx/man/man1/rtx.1 "$pkgdir/usr/share/man/man1/rtx.1"
}

check() {
    "$srcdir/rtx/bin/rtx" --version
}
