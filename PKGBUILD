# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=bridle-bin
pkgver=0.2.9
pkgrel=1
pkgdesc='Unified configuration manager for AI coding assistants'
arch=('x86_64' 'aarch64')
url='https://github.com/neiii/bridle'
license=('MIT')
depends=('gcc-libs' 'xz')
provides=('bridle')
conflicts=('bridle')
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/bridle-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/bridle-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('93e767b0d93f6f31b7ec3c4d3ae5ab68c64275c8d43e554478c7057e3ec6007e')
sha256sums_aarch64=('0d6014477c585c232f7cc11893749bd855159c368a6571bf67f2b0940a4e98f3')

package() {
    local _dir="bridle-${CARCH}-unknown-linux-gnu"
    [ "$CARCH" = "x86_64" ] && _dir="bridle-x86_64-unknown-linux-gnu"
    [ "$CARCH" = "aarch64" ] && _dir="bridle-aarch64-unknown-linux-gnu"

    install -Dm755 "$_dir/bridle" "$pkgdir/usr/bin/bridle"
    install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
