# Maintainer: agony <27015 at riseup dot net>

pkgname=fallow-bin
pkgver=3.49.0
pkgrel=1
pkgdesc='Codebase intelligence for TypeScript and JavaScript (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/fallow-rs/fallow'
license=('MIT')
depends=('glibc' 'libgcc')
provides=("fallow=${pkgver}")
conflicts=('fallow')
install=fallow.install
_release="${url}/releases/download/v${pkgver}"
source=("fallow-${pkgver}-LICENSE::https://raw.githubusercontent.com/fallow-rs/fallow/v${pkgver}/LICENSE"
        "fallow-similar-code-${pkgver}-LICENSE::https://raw.githubusercontent.com/fallow-rs/fallow/v${pkgver}/tools/similar-code-sidecar/LICENSE")
source_x86_64=("fallow-${pkgver}-x86_64.tar.gz::${_release}/fallow-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fallow-${pkgver}-aarch64.tar.gz::${_release}/fallow-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('b291c8e1e0cac7a3646cd5539d7c728f2ce425678eedd1afeeea3c35838c29a9'
            'efd3a4139905e009f1f321ab6b38b73b7b6ec2ed655d12f68df69472e4dd1981')
sha256sums_x86_64=('93f745acc47e8891f107914a9fb8fc08d34c6766d8cb0f58c9be5ca343415ab5')
sha256sums_aarch64=('a8040c191398b3256fea518b0ac3001afbe95b3d84141a2422f66190f93e59ab')

package() {
  install -Dm755 fallow fallow-lsp fallow-mcp fallow-similar-code -t "${pkgdir}/usr/bin"
  install -Dm644 "fallow-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "fallow-similar-code-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/tools/similar-code-sidecar/LICENSE"
}
