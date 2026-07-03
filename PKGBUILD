# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.2.4
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
sha256sums_x86_64=('e1d9d50a8e067d33b6153b87f214e1f0bde0774c2de755c02907996917a23d27')
sha256sums_aarch64=('ff5badd81c3a9a4582f4ed30a72acbb4490c5b83394642b33996dc8c7b67a1d5')
sha256sums_riscv64=('0f0e005e335e2cb5cbb474d13d25683944d644f9e8aa87e2c53a68694d40cfa0')
sha256sums_armv7=('b91f7c0ce6c0bbee6c5b79ba58bbb7dec1670a006ae2d1c46bb7ec286da27d65')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm 644 LICENSE-MIT LICENSE-GPLv3 -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
