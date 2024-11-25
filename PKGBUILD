# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

_pkgname=ts_query_ls
pkgname=ts-query-ls-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url="https://github.com/ribru17/$_pkgname"
license=('MIT')
provides=("$_pkgname")
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('41aa56bd0406f09e4798fa3d0fab467545d8eeedc4b34e1aaeb62eca91534840')
sha256sums_aarch64=('84a57be701c6165031317e0972751354b1170d4f6bd312e563b36f9461f64d5c')

package() {
    cd "$srcdir"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
