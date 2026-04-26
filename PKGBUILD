# Maintainer: opencode <opencode@example.com>

pkgname=agent-browser-bin
pkgver=0.26.0
pkgrel=4
pkgdesc="Fast browser automation CLI for AI agents (native binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
provides=('agent-browser')
conflicts=('agent-browser')
optdepends=(
    'chromium: Default browser engine (recommended)'
    'google-chrome: Alternative browser engine'
    'lightpanda: Alternative browser engine optimized for AI'
    'appium: For iOS Simulator support (--provider ios)'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/vercel-labs/agent-browser/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vercel-labs/agent-browser/releases/download/v${pkgver}/agent-browser-linux-arm64")

sha256sums=('014bb31e83d5c2e76aea1cc6e82217346ab41362f32cb355ad0f5c10aa0aeaff')
sha256sums_x86_64=('8784dc259abf72ee04e751b45677d956387af50c99aec5dcd7a41a9bc498e3c3')
sha256sums_aarch64=('b3901b17298f6ce6511fcae5c576068a3e8a510ecb365c8ccd876b9b82db4447')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/agent-browser"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
