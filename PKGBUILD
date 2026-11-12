# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
pkgname=posthog-cli-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="PostHog CLI tool for feature flags, experiments, and analytics"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
optdepends=('nodejs: required for the posthog-cli api command')
provides=("posthog-cli=${pkgver}")
conflicts=('posthog-cli')

_base_url="${url}/releases/download/posthog-cli/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/posthog-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/posthog-cli-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('5417354c2faab32e377be178382d28e2e327ecce85858e3e05e905657986c9b9')
sha256sums_aarch64=('9d8b69251f8361916d27b27c694ecdb5336865c1e6cb6ef107334b8b5e66b22c')

package() {
    install -Dm755 "posthog-cli-${CARCH}-unknown-linux-gnu/posthog-cli" \
        "${pkgdir}/usr/bin/posthog-cli"
    install -Dm644 "posthog-cli-${CARCH}-unknown-linux-gnu/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
