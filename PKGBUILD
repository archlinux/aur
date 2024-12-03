# Maintainer: Omar Valdez <omarantoniovaldezf2@gmail.com>
#
# shellcheck disable=SC2034,SC2164,SC2154

_pkgname=ts_query_ls
pkgname=ts-query-ls-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Language server for tree-sitter's query files"
url="https://github.com/ribru17/$_pkgname"
license=('MIT')
provides=("$_pkgname")
depends=('gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/ribru17/$_pkgname/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c2d9084c3ab42f7b16a582f30661359d8c8f88842ca3f30b17147f72b609b457')
sha256sums_aarch64=('09c98ea343a125c632252b9993e7468381ab5834d9bbf5a8e9cdd327603e1363')

package() {
    cd "$srcdir"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
