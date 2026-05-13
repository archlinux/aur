# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.3.4
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
    sha256sums=('37a146157646e625c748c81a77ec1b9427aa429dde65b463b687af99e3a4c8a2')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("${_srcname}::https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('bf207446c4ee94db65c640dd775362a14666072f90e1e42ba684fc8ad94ca21d')
fi

package() {
    cd "$srcdir"
    install -Dm755 "$_srcname" "$pkgdir/usr/bin/nyado"
}