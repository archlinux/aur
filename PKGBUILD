# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v3.5.1
pkgver=3.5.1
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
    "c28a47eb56a85527057cfd846cee71f7b1f46fb7732767c1e44efb63de30fb760734e49e51ca12ebcc1340647b89c567ade0d2eb2da25b501add106f1ae3cc52"
    "1fa37a5c7d0e0d37ccfddde73b1cc9f9c633759cc5decde87ce372f41c10fb8c724636fa08969a473cd7b4abca0e180092d6cd0a3e2ddf4140178ed59bb96ebd"
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
