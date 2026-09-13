# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.27.0
pkgrel=1
pkgdesc='A Rust-native release automation tool'
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('940c48184fd5054f4c43ccfed1b09d5cd0c25a388cfa2a1ff2c2075580b2ea61')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('72f18dc29c6f96f340389ffc3dcabce821ee07c68bf0d3a4c87f99e718e744e0')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
