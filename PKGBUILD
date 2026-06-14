# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-bin
_pkgname=swpui
pkgver=0.9.0
pkgrel=1
pkgdesc='Search and replace, TUI style.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/beeb/swpui'
license=(
     'Apache-2.0'
     'MIT'
)
makedepends=(
    'cargo'
    'xz'
)
options=(!debug)
provides=('swp')
conflicts=('swpui-git' 'swpui')
source_x86_64=("$pkgname-$pkgver-bin.tar.xz::$url/releases/download/v$pkgver/swpui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$pkgname-$pkgver-bin.tar.xz::$url/releases/download/v$pkgver/swpui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('32ca309200241df91da669f8940a7886d6e55117b3a776e5ae2ce90e9ca0e8ce')
sha256sums_aarch64=('b3b9d7acc90ae9ffb63b31faa8b99c7608a739019aaf4587e8397bf4f1d1a690')

package() {
    cd "swpui-$CARCH-unknown-linux-gnu"
    install -Dm0755 swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
