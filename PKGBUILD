# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI, inspired by meowdo"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")
options=(!strip)

if [[ "$CARCH" == "x86_64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-x86_64-unknown-linux-musl")
    sha256sums=('83b208b497c9aadd3ceaa2dce29ad125893dbd2eb4f46ab60a912ade6d58c6c5')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('139b854f60246ce30c9710fda05d8f1a76c4f18a26553e6e7dca4d8bf7621229')
fi

package() {
    cd "$srcdir"
    install -Dm755 "${source##*/}" "$pkgdir/usr/bin/nyado"
}