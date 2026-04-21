# Maintainer: sQVe <oskargrunning@gmail.com>
pkgname=beads-rust-bin
pkgver=0.1.45
pkgrel=1
pkgdesc='Rust port of beads issue tracker — SQLite + JSONL-in-git sync model (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Dicklesworthstone/beads_rust'
license=('LicenseRef-MIT-with-OpenAI-Anthropic-Rider')
depends=('gcc-libs')
provides=("br=${pkgver}")
conflicts=('beads-rust')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Dicklesworthstone/beads_rust/v${pkgver}/LICENSE")
source_x86_64=("br-v${pkgver}-linux_amd64.tar.gz::https://github.com/Dicklesworthstone/beads_rust/releases/download/v${pkgver}/br-v${pkgver}-linux_amd64.tar.gz")
source_aarch64=("br-v${pkgver}-linux_arm64.tar.gz::https://github.com/Dicklesworthstone/beads_rust/releases/download/v${pkgver}/br-v${pkgver}-linux_arm64.tar.gz")
sha256sums=('32a82e0a5754e72e51fae44b65a936c831c07376f21c90f5fb9e76897fcc3509')
sha256sums_x86_64=('9bed3abf29e91a30f2bc5cde6309af3a413659e67f311f67c1e42f76a79933d5')
sha256sums_aarch64=('07548fe5933ce1ffbf36d4d08ce5586369f4733f845229454dea1cd17a87a395')

package() {
  install -Dm755 "${srcdir}/br" "${pkgdir}/usr/bin/br"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
