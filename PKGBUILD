# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flyline-bin
_pkgname=flyline
pkgver=1.7.1
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
    '43bacffe397a04c31fd00f8fdd9bba70ab425f2e484f53c420120d37172df357'
    'bb423e9f9dd6e3331b822117e164b147ea1a8223b3046c4ab58af70c2e1f1fac'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
source_x86_64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
source_armv7=("libflyline-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/libflyline-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_x86_64=('a17fa184ddbfad299bd929a8478f829e64ab18ffbe07f01bd60d74f09df04446')
sha256sums_aarch64=('5fd3476a6175b4217fcd42fed6f890a84c23c2eea902962e4628ddc2f6bd45f7')
sha256sums_riscv64=('319c0e4aecbf7998383637dc9ae8b63ac7bd8eb193b23c02a551209927e57ccb')
sha256sums_armv7=('4f66aa4510dd62540fa8a5d9b9fef66eb81ebe03e71341b4bb6a0b26540f7cf3')

package() {
    install -Dm0755 libflyline.so."${pkgver}" "$pkgdir/usr/lib/libflyline.so.${pkgver}"
    ln -sf "libflyline.so.${pkgver}" "$pkgdir/usr/lib/libflyline.so"
    install -Dm644 flyline-LICENSE-MIT-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 flyline-LICENSE-GPLv3-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPLv3"
    install -Dm644 flyline-README-"${pkgver}".md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
