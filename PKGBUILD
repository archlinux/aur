# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.11.0
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
    !lto
    !debug
    !strip
)
provides=("libflyline.so.${pkgver}")
conflicts=('flyline' 'flyline-git')
source=(
    "${_pkgname}-README-${pkgver}.md::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/README.md"
    "${_pkgname}-LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-MIT"
    "${_pkgname}-LICENSE-GPLv3-${pkgver}::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-GPLv3"
)
sha256sums=(
    'f377208a55db6017fe446365cc52f1ce45786c8f4f65a0ab9a73014db379c0bf'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('40b30c88aabc8baf23e547af9ffd3388cbfa4b044df1ab53f2ba997a66bf436a')
sha256sums_aarch64=('4bd49880574d7ab5700fee579b7131fc7caae468d36d391e2986cb370d1a7816')
sha256sums_riscv64=('0f575262a38e5e1a232e9b0b98ad49b75a26d69b22e85a91d9643e8ffcf8c25f')
sha256sums_armv7=('61eb1a10a1c623e6e5dad23999372bc4fef4ecdd6ae7b9de4ad329b841d8bcb1')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm644 flyline-LICENSE-MIT-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 flyline-LICENSE-GPLv3-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPLv3"
    install -Dm644 flyline-README-"${pkgver}".md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
