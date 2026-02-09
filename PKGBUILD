# Maintainer: Love Billenius <lovebillenius@disroot.org>
pkgname=lolcat++-bin
_pkgname=lolcat++
pkgver=2.5.0
pkgrel=1
pkgdesc="A lolcat reimplementation in C++ -- BLAZINGLY FAST"
arch=('x86_64')
url="https://github.com/lolcatpp/lolcatpp"
license=('BSD-3-Clause')
depends=()
provides=("$_pkgname" "lolcat")
conflicts=("$_pkgname" "lolcat" "lolcat-c" "lolcat-rs")

source=(
    "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/lolcat-linux-amd64"
    "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
)
sha256sums=(
    '1d7ce0ef643002ba01118834e921ee9304a7bff4cd58c139d64796a7a32d8fee'
    'acb93081ed46c3ac2a45091a6d2a0b522921f884e47bb2d090dbeee4767c7b85'
)

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/lolcat"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
