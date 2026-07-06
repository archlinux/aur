# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.3.0
pkgrel=2
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
    "README-${pkgver}.md::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/README.md"
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-MIT"
    "LICENSE-GPLv3-${pkgver}::https://raw.githubusercontent.com/HalFrgrd/flyline/refs/tags/v${pkgver}/LICENSE-GPLv3"
)
sha256sums=(
    'e56a239d0989e33f07270279036528b83082c806c00aeb35f631c6950c77a393'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('21bb0a7a0e417496ff68ef8379cadc05d35e42aee357fc64ad9a8d95f69320f8')
sha256sums_aarch64=('a889bc16ee31e5a6b85728b9b9d9d23d67f3f0fbb21bf0cae7e27890bd43c4cd')
sha256sums_riscv64=('556140f18f314fa651e5b0f8a0153180f93e04487664528d09abb078759223cc')
sha256sums_armv7=('2198b29ef182402b2fcf58acabe45575c2afad00a113d762d68cf51c6c97c154')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm644 LICENSE-MIT-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-GPLv3-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPLv3"
    install -Dm644 README-"${pkgver}".md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
