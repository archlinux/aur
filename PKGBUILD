# Maintainer: TJ Smith <tj@jarvispro.io>

pkgname='anodizer-bin'
pkgver=0.25.2
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url="https://github.com/tj-smith47/anodizer"
license=('MIT' 'Apache-2.0')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64-extra.tar.xz")
sha256sums_aarch64=('df6025f29ae31d6c1c34b694e69e08f44d781fff155fe77d4d6c1aea556d5708')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64-extra.tar.xz")
sha256sums_x86_64=('6e396b326613cb9a3423988b628bdbce002f46c0ac20509694203dc670a8f31d')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
    for _l in "$srcdir"/LICENSE*; do [ -e "$_l" ] && install -Dm644 "$_l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_l")"; done
}
