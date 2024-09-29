# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v2.2.0
pkgver=2.2.0
pkgrel=1
pkgdesc="A local diffing tool for decompilation projects"
arch=("x86_64")
url="https://github.com/encounter/$_pkgname"
license=("Apache-2.0 OR MIT")
depends=("fontconfig")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname-$pkgver::$url/releases/download/$_pkgver/objdiff-linux-x86_64"
    "$_pkgname-cli-$pkgver::$url/releases/download/$_pkgver/objdiff-cli-linux-x86_64"
    "$_pkgname.desktop"
    "$_pkgname.png"
    "LICENSE-APACHE"
    "LICENSE-MIT"
)
b2sums=(
    "daea366b1ffbd7fea89e96dfb3afb75b6c6928099eeb5a3d0445f2986c8a5c2ca7d7d2bf573e1b5c3fa2cf4265deba58d2bf78fed24731b7ffc0f5281de27252"
    "d2b14e3c5d01a7453e3fdfd52833acaf0cb83c09e9922c000735deaf76364286200da93fdc9922770b628ae02508a6b261163e6c6f3a0d46e25bd86820ae7475"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
)

package () {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 "$_pkgname-cli-$pkgver" "$pkgdir/usr/bin/$_pkgname-cli"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "../LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "../LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
