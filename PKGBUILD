# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-bin
_pkgname=swpui
pkgver=0.10.0
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
sha256sums_x86_64=('51a91176a621e0b831bda4309210ff0fcbcc028ead99eb188e4199044b0a42d8')
sha256sums_aarch64=('57c9a605ba6e6a13d5feb078777f2cf7c18f43953c2c68e0dfea5180d589f22d')

package() {
    cd "swpui-$CARCH-unknown-linux-gnu"
    install -Dm0755 swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
