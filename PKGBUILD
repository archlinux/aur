# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.30.0
pkgrel=1
pkgdesc='A Rust-native release automation tool'
arch=('aarch64' 'x86_64')
url='https://github.com/tj-smith47/anodizer'
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('8155e32a70f8890fa8e6790fc3f0e6028e12111cf988e82ae8f30a4543a32bb3')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.gz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('486d99cd686232a8a6ade1711635490c42c92d3522032155106ff90642df05bb')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
