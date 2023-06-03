# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.32.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.32.0/rtx-v1.32.0-linux-x64.tar.gz")
sha512sums=('7ee87f5b6b72d601e7c691d20f069413883f3d8a640eb8851ae714a6e7723a3f6cd36c8bf3d76a4e39b0288d364283fb968a4ade9c2ea88770577e5353b12356')

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
