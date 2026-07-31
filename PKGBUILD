# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
pkgname=posthog-cli-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="PostHog CLI tool for feature flags, experiments, and analytics"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=('posthog-cli')
conflicts=('posthog-cli')

_base_url="${url}/releases/download/posthog-cli/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/posthog-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/posthog-cli-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('c7f6f9d31b263a43abf75a20d37ae1452899d256d91e7763273f40efdbb4464f')
sha256sums_aarch64=('69bab460767115d63b92fa53528b0201641cd75e366d206ce7806b5877ce7234')

package() {
    install -Dm755 "posthog-cli-${CARCH}-unknown-linux-gnu/posthog-cli" \
        "${pkgdir}/usr/bin/posthog-cli"
    install -Dm644 "posthog-cli-${CARCH}-unknown-linux-gnu/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
