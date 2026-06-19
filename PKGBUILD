# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.5.0
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
    sha256sums=('4a4d3f0222c4f393f16ad888f7bb73e518b606d36032bc124056ffd6978c37ee')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("${_srcname}::https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('e906f2587397a6bfa3a2b1bcf4190937b26371d88e8c9b8cf379bebfe4d696e6')
fi

package() {
    cd "$srcdir"
    install -Dm755 "$_srcname" "$pkgdir/usr/bin/nyado"
}