# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.26.0
pkgrel=1
pkgdesc='A Rust-native release automation tool'
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('04594e492860678c6a7ab23ef47c6561f4c6c1fb4e41c2f581f34a5e6237e451')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('39ba0e18e75a9e4979289cd170d3e51e44973e265167d9a84f669cada5abcb22')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
