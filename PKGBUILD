# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.9.0
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
    '730f57df1ff920dba803f8809df760b192121fca0b458e566c5b0b4c55131487'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('0b96ac1b00826e3cde3dcf1092e3c5f3ac06c4c8cabc813f47dc2b986838fc0f')
sha256sums_aarch64=('5da7110a9e793084e0f42976b4df8d399edf0fcfa0b1e95a4df2f4cd202433a1')
sha256sums_riscv64=('d93ab63ca8d7aed64ea2734d58c349929a99eaa0784a3df913ef7e5ba0d22700')
sha256sums_armv7=('86f30352db38107fb2d6b9734cad68537e8b69162c399736297654656adc00af')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm644 flyline-LICENSE-MIT-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 flyline-LICENSE-GPLv3-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPLv3"
    install -Dm644 flyline-README-"${pkgver}".md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
