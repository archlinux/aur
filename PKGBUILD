# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.2.5
pkgrel=1
pkgdesc='Bash plugin to replace readline for a modern line editing experience: syntax highlighting, agent integration, rich prompts, tooltips, fuzzy history search, and more'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
    'armv7'
)
url='https://github.com/HalFrgrd/flyline'
license=(
    'MIT'
    'GPL-3.0-only'
)
depends=(
    'bash' 
    'gcc-libs'
)
options=(
    # !lto
    !debug
    !strip
)
provides=("libflyline.so.${pkgver}")
conflicts=('flyline' 'flyline-git')
source=(
    "README.md::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/README.md"
    "LICENSE-MIT::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-MIT"
    "LICENSE-GPLv3::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-GPLv3"
)
sha256sums=(
    '8acb271c74443c2c6835a40acd4bb05a61e796f2eba664ed2e98d55457aad55e'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('4ce8db86ecec1c9e523cc2de58618cc182540fe735d497d230e9c66e9f1dddc6')
sha256sums_aarch64=('4b532b60c2b1de3e32cff7e0ddf4b7f9c1bfb21dc51905ff2a69026c912ea777')
sha256sums_riscv64=('54e751e85d89f0f7d3e1b892d3d7644e62961a91965494a5485fb5d463a4355d')
sha256sums_armv7=('7c17a91762b6283789b6d01b1a1ff7bff892e1c0f44f0f9b2f81f7cd662f76fa')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm 644 LICENSE-MIT LICENSE-GPLv3 -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
