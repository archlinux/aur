# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('fff5c90171a477ade0835971edad7d7056512f559dbc402bdc5a72dad06b120d')
sha256sums_aarch64=('93fd8ac609653883a98ecdde9322b8e523e81573e73c73366aa63398742433bc')

package() {
    case "$CARCH" in
        x86_64)
            install -Dm755 "${srcdir}/aws-sso-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/aws-sso"
            ;;
        aarch64)
            install -Dm755 "${srcdir}/aws-sso-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/aws-sso"
            ;;
        *)
            printf >&2 'error: unsupported architecture: %s\n' "$CARCH"
            exit 1
            ;;
    esac
}
