# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.28.1
pkgrel=1
pkgdesc='A Rust-native release automation tool'
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('bcd85ee17704032bb6cd0061081c788a4868df2dc932b9ef09ab9e27a26de974')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('a215aa5c062eb151d3a294dd1375eacd1bd3f16c8eae9f3506f68a14a4c8fca9')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
