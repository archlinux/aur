# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
pkgname=posthog-cli-bin
pkgver=0.7.9
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

sha256sums_x86_64=('092d62d020319de15fef045c4f904ec705ab844e9d2979150a5353e83194336e')
sha256sums_aarch64=('619d989e29dce1318059c2ded1a2929c0c92b9d800461ad6ecbd648319a4fac6')

package() {
    install -Dm755 "posthog-cli-${CARCH}-unknown-linux-gnu/posthog-cli" \
        "${pkgdir}/usr/bin/posthog-cli"
    install -Dm644 "posthog-cli-${CARCH}-unknown-linux-gnu/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
