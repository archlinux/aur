# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.30.6
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.30.6/rtx-v1.30.6-linux-x64.tar.gz")
sha512sums=('ed6b5abde64f571978371285f9cc2a39a957a1f71156947febb83f9f329b36d679887fd9a642ad56fb57fc82078c050c3b869e0a8836054ae1b1def9e0811040')

prepare() {
    tar -xzf rtx-$pkgver.tar.gz
}

package() {
    cd "$srcdir/"
    install -Dm755 rtx/bin/rtx "$pkgdir/usr/bin/rtx"
    install -Dm644 rtx/man/man1/rtx.1 "$pkgdir/usr/share/man/man1/rtx.1"
    install -Dm644 rtx/completions/rtx.bash "$pkgdir/usr/share/bash-completion/completions/rtx"
    install -Dm644 rtx/completions/rtx.fish "$pkgdir/usr/share/fish/completions/rtx.fish"
    install -Dm644 rtx/completions/_rtx "$pkgdir/usr/share/zsh/site-functions/_zsh"
}

check() {
    "$srcdir/rtx/bin/rtx" --version
}
