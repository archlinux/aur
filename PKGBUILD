# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
pkgname=posthog-cli-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="PostHog CLI tool for feature flags, experiments, and analytics"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
optdepends=('nodejs: required for the posthog-cli api command')
provides=('posthog-cli')
conflicts=('posthog-cli')

_base_url="${url}/releases/download/posthog-cli/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/posthog-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/posthog-cli-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('01412c66faaa9097180a09d63e7fe7202c9df778659f2422f1cf0c5b371c15d3')
sha256sums_aarch64=('62e3c62122c74efc428940e5b295e7a99841dad42c07e54b07b8646bb83d9e12')

package() {
    install -Dm755 "posthog-cli-${CARCH}-unknown-linux-gnu/posthog-cli" \
        "${pkgdir}/usr/bin/posthog-cli"
    install -Dm644 "posthog-cli-${CARCH}-unknown-linux-gnu/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
