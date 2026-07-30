# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.4.0
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
    'eb85f007f2360be0894c4d49ad6e648d70aae83fbfd24fd11017b00ba54506a3'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('626c227a16ec0ff2abc33f848c090ed86711f094af1ccb6bb845fe207cef22b0')
sha256sums_aarch64=('1969543c3969c7b834cbffadb8f629513715fdfcd14e7187ee238784692eddef')
sha256sums_riscv64=('3c0905a31daa43295aeae1dddf6a9419ab010296346f15e41b2e32f8408f3c54')
sha256sums_armv7=('453d154f65c9942a4cb22f836898474439208898df7b091e88bab7b797c20a74')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm644 flyline-LICENSE-MIT-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 flyline-LICENSE-GPLv3-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPLv3"
    install -Dm644 flyline-README-"${pkgver}".md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
