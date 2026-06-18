# Maintainer: Cenk Kalpakoglu <cenk.kalpakoglu@gmail.com>
pkgname=faultkit-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Fault injection for the agent era — exercise the LLM, RAG, and tool-call failures that mocks can't simulate."
arch=('x86_64' 'aarch64')
url="https://faultkit.dev"
license=('Apache-2.0')
provides=('faultkit')
conflicts=('faultkit')
source_x86_64=("faultkit-${pkgver}-x86_64.tar.gz::https://github.com/faultkit/faultkit/releases/download/v${pkgver}/faultkit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("faultkit-${pkgver}-aarch64.tar.gz::https://github.com/faultkit/faultkit/releases/download/v${pkgver}/faultkit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('92d8b1fdeacf162196a167638837270d6cfcc4bd3afd429cdaae9760f3471254')
sha256sums_aarch64=('30744ad23c3d904a05c864767a1254c50dc7ae24721e36a38c17482db37fdf89')

package() {
  install -Dm755 faultkit "${pkgdir}/usr/bin/faultkit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
