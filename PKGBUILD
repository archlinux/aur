# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('af624e4b218cb6f00e41dfb9cfa8db9554a9e6b42b64c56ca6bf30ebdd1389c5')
sha256sums_aarch64=('eca27b0b81d19e0b8a05e44c66b0eee56920f3825b690e6596161f6d4bfaeedc')

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
