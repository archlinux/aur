# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v2.7.1
pkgver=2.7.1
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
    "38261f34f6a7a7d75a77509fb92652fd8ba1bc6dcdfe144a0b210cf2048d801d0ccc07b4e855bbf4efe8b99c343c4cdb140264086e9a9e1a68ca7b355e8b4108"
    "53ba6b1076f9b72d4994888d54173815e905d47eb3147be73d8a664e53aff78d1f876fff9d6c494b8b99972abb4043aa4573f52e5d913878fd28f67bc9c7b17a"
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
