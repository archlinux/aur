# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=snake-asm
pkgver='0.2'
pkgrel=2
pkgdesc="Terminal-based snake game written in $CARCH assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/snake-asm"
license=('MIT')
depends=()

_bin="$pkgname-$pkgver-bin"
source=(
    "$_bin::$url/releases/download/v$pkgver/snake-asm"
    "$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('5b7fecae4d92c192d419d7d93c6789b46079f0e24399a903c005dffb7c4d19bf96cfa0ec26c75b4d5e138c7601b99d416904725fb0a5beff4c881e498f739872' '786a54fd97a8ee6d84561b9fb4347aa47cf295c2306cfc21ab8c6d36a0751d1c591f7bba27d2650486a591160d0ab24ef4431978024200a340f571035c799ee3')

prepare() {
    chmod 755 "$_bin"
}

package() {
    local prefix="$pkgdir/usr"
    local binprefix="$prefix/bin"
    local licenseprefix="$prefix/share/licenses/$pkgname"
    mkdir -p "$binprefix" "$licenseprefix"

    cp "$srcdir/$_bin" "$binprefix/$pkgname"
    cp "$srcdir/$pkgname-$pkgver/LICENSE" "$licenseprefix"
}
