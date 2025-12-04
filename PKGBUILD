# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v3.4.5
pkgver=3.4.5
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
    "47dc5db2d412b35cc82255d5da9f45452be3de5e45ae300495f4edf6dd42d1523b4cc6c045abee2148ad15a10ef1af8ebc4f59b31b68c5a3644ad02aef3304a3"
    "7e976f235e41ffd9529024a3da758357d254522f55acf0495b5247c8d49b68e94ab3b017c11a6991427c6c71a56e78ac44a703fb1a2b33f3a587fafbb4466a1e"
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
