# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v3.4.1
pkgver=3.4.1
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
    "2094e77922e40a514ed447ec47e30c69872500054a663049e59821177845ae9c02c8e5e8b2e06527f8c7095be56042eca34443b83ead43cbe2e38200416687a7"
    "ec2164ca94fe70bddf8edfe9073a6ac241f1eaa33375a7337b78bbe8937b74cb9a1cc8b809eed18b288e7576aafe61a0601919c7f0a2df47a8b27e52b85dd313"
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
