# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
_pkgname=objdiff
pkgname="$_pkgname-bin"
_pkgver=v2.1.0
pkgver=2.1.0
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
    "LICENSE-APACHE"
    "LICENSE-MIT"
)
b2sums=(
    "31b5b65b7d1120fa7b733aa2b0dec403bfcc638ecb33b34cb331a7be76cc644cc879fdfb1a962ba3c1319ce0ce0c3ada06d1e83bd5f1462dd72ca6258829b4bc"
    "c09ab428cc0ec5aca43a4623c8bc7606a1f5caea70087f7effc75f97c67bcfd6858f5915783df65897e80ec30526f41347af2c8de3c3d6368fba4f65e49a3d2e"
    "SKIP"
    "SKIP"
)

package () {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 "$_pkgname-cli-$pkgver" "$pkgdir/usr/bin/$_pkgname-cli"
    install -Dm644 "../LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "../LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
