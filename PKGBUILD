# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI, inspired by meowdo"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")
options=(!strip)

_srcname="nyado-${CARCH}-unknown-linux-musl-v${pkgver}"

if [[ "$CARCH" == "x86_64" ]]; then
    source=("${_srcname}::https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-x86_64-unknown-linux-musl")
    sha256sums=('5bce58c4fe57d6644c8f1434e09fb484477a900edb9a8c7b961a6d64ee367d56')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("${_srcname}::https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('602ead309219d94afb1800060b34a6a215acee372a56e90dbd59098ccf94dbfc')
fi

package() {
    cd "$srcdir"
    install -Dm755 "$_srcname" "$pkgdir/usr/bin/nyado"
}