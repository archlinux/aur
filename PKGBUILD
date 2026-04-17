# Maintainer: sQVe <oskargrunning@gmail.com>
pkgname=beads-rust-bin
pkgver=0.1.44
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
sha256sums_x86_64=('a7957e56ff61ef2133da10c82045744cdddfe2e5b71cf92d79bdc24195194e8c')
sha256sums_aarch64=('58f430223af973e4c815e3814a356ccf4a62a0051ae1fb94510e034cfae2e8c4')

package() {
  install -Dm755 "${srcdir}/br" "${pkgdir}/usr/bin/br"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
