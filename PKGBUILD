# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
pkgname=posthog-cli-bin
pkgver=0.18.6
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

sha256sums_x86_64=('bfe223abd7d53c0393935a8c5282d6ebf4100c1ff4796859c25d215a4858e909')
sha256sums_aarch64=('e66dcd85a9e44cebb661b17cb061aa2b3e188dd7da1b8e254eedbf6d46002f1c')

package() {
    install -Dm755 "posthog-cli-${CARCH}-unknown-linux-gnu/posthog-cli" \
        "${pkgdir}/usr/bin/posthog-cli"
    install -Dm644 "posthog-cli-${CARCH}-unknown-linux-gnu/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
