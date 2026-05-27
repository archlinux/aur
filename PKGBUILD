# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-bin
_pkgname=swpui
pkgver=0.8.0
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
sha256sums_x86_64=('ea9a26ca02587f2c0cb8f734abfba0301499224c5c5b564fddbe98a4e4104705')
sha256sums_aarch64=('7f52d726a7989ff2330913ca4f0a87dfd5f768a486b82f1de2a49ee4e7c5ae46')

package() {
    cd "swpui-$CARCH-unknown-linux-gnu"
    install -Dm0755 swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
