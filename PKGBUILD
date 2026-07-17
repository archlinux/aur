# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.21.0
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url="https://github.com/tj-smith47/anodizer"
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64-extra.tar.xz")
sha256sums_aarch64=('59f92c6e0f217141c133c6ccba6f603abc883938995750c29f14aff6d3810435')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64-extra.tar.xz")
sha256sums_x86_64=('9cdc82060e582cd06006e08a4e773fffd2763f3a1d2ad99e49d31277bc5bc475')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
