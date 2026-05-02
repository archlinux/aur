# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.2.8
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
    sha256sums=('32b63c797e4e3ec333de5be6547251a5aa230182c384c9bcaef2f9bb9722eb1d')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('73f8a1b3fb707e05e5597a99b903cff43c4bd260c549c077efd17aa98426d98c')
fi

package() {
    cd "$srcdir"
    install -Dm755 "${source##*/}" "$pkgdir/usr/bin/nyado"
}