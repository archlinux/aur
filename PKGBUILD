# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli-bin
pkgver=2.3.4
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('4481466189fd3f9207467186a3f1421fd305306e820bee8e29be8a13850a3c6c')
sha256sums_aarch64=('a5e5bb3d10b9718b70b047b346e5091310084e03df52909ca76267e2761e8849')

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
