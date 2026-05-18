# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=intellishell-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="Smart bookmark manager for shells"
arch=("x86_64" "aarch64")
url="https://github.com/lasantosr/intelli-shell"
license=("Apache-2.0")
provides=("intellishell")
conflicts=() # NOTE update if intellishell package is created
depends=("glibc" "libgcc" "zlib")
options=( "!debug")
changelog="CHANGELOG"
install="intelli-shell.install"
source=("LICENSE::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/LICENSE",
        "README.md::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/README.md")
source_x86_64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('26db58a1cfc2803a55de04a48d111afc8f00981ed860e5006104cd222bf1fd8f'
            '011a0e2d34f3ccf3abe0e9c2240c0cb9a7bb95c09f64555b73d7a6f9ee7fe4bc')
sha256sums_x86_64=('2054a5645166fd056dcd649163676de1bfd2d6020d13e01e89c8f771c38f477b')
sha256sums_aarch64=('cfef9faf18251d3cb1ab4f9d1d7ef74d1cac49c4a9cf6abd7be8f4dc2473c0d5')

package() {
     cd "$srcdir"
     install -Dm755 intelli-shell "$pkgdir/usr/bin/intelli-shell"
     install -Dm644 README.md     "$pkgdir/usr/share/doc/intellishell/README.md"
     install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/intellishell/LICENSE"
}
