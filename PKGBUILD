# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

_pkgname=ts_query_ls
pkgname=ts-query-ls-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url="https://github.com/ribru17/$_pkgname"
license=('MIT')
provides=("$_pkgname")
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('589567a9f3a3b6e955f98cef4bed9e6a1cc13dd8b5a02a4a4f6fa684679636ab')
sha256sums_aarch64=('ba5ed59840f702f048348d4cbfa1a624f1fd81ac77208d3c133cdc8704e4d0a2')

package() {
    cd "$srcdir"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
