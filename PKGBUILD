# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.2.9
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
    sha256sums=('cc647372769de492ccd35e146b6e77a980f660ab6ea0a40ba36f643513f481b3')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('b152f55e786a6c192f19da8cf1eb850e98479023a8a8be60ff5940b0d381c11b')
fi

package() {
    cd "$srcdir"
    install -Dm755 "${source##*/}" "$pkgdir/usr/bin/nyado"
}