# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli-bin
pkgver=2.2.5
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('0c487841b5dfcef22019c7796d513040c561036a2d2de7ef339ef406270a59be')
sha256sums_aarch64=('ceef6e235fb8263d413d23d66ad3535aae98d3754c76caaa0d356abe52869784')

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
