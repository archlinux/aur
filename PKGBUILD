# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v3.1.1
pkgver=3.1.1
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
    "c23831ac29cf38d80f64eca2e96e132b4fe7a2213ae376787a94e3d880b26b6bad3562400b6650384432d5499141b95146ecf2708163d94d67f5943b06e80f59"
    "c7ee71329cfc256cad548c49e0a3921bcb8520a597600bbfc5d3a35d69bab1230513643e9db54a2baeb8436688dc5d02e5724b04d46a0f214698c2a891d44531"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
)
options=(!strip !debug)

package () {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 "$_pkgname-cli-$pkgver" "$pkgdir/usr/bin/$_pkgname-cli"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
