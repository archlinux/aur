# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=snake-asm
pkgver='0.1'
pkgrel=1
pkgdesc="Terminal-based snake game written in $CARCH assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/snake-asm"
license=('MIT')
depends=()

source=(
    "$pkgname::$url/releases/download/v$pkgver/snake-asm"
    "$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('3cd6dd15cba6e71043559cad35941dc2263cf31e1572e1930a40cd017dbb2d1da6be05a4bc1cb083dc353d3b036db85d7911569e5d2b1ba220ba605a91df8929' 'fed4140b37cfa8b0334d1d133013e73cff1bf2018a5150d6dc63e960de7da87de6328a1adc89dc3a918ac57519d76e77e4956899e85f4ad459603c29e948edc0')

prepare() {
    chmod 755 "$pkgname"
}

package() {
    local prefix="$pkgdir/usr"
    local binprefix="$prefix/bin"
    local licenseprefix="$prefix/share/licenses/$pkgname"
    mkdir -p "$binprefix" "$licenseprefix"

    cp "$srcdir/$pkgname" "$binprefix"
    cp "$srcdir/$pkgname-$pkgver/LICENSE" "$licenseprefix"
}
