# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-bin
_pkgname=swpui
pkgver=0.10.1
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
sha256sums_x86_64=('25a2c2cfdf063783da97ecfd117ef1642586694d4a58a39645bd2b7281118067')
sha256sums_aarch64=('5c63d934b0604863bc70d711920df9d9b0fb1839e3429ae74fc8d04fc03d5c28')

package() {
    cd "swpui-$CARCH-unknown-linux-gnu"
    install -Dm0755 swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
