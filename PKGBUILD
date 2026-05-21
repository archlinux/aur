# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-bin
_pkgname=swpui
pkgver=0.7.2
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
sha256sums_x86_64=('0df8d4d05aa0b0189cc87a903f25db927830aa86098b6ef1165656e1ed72fcca')
sha256sums_aarch64=('75a84912fb263b8dbabf974a2999934498cf302d09a07578cb45488771f8ec20')

package() {
    cd "swpui-$CARCH-unknown-linux-gnu"
    install -Dm0755 swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
