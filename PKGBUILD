# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli-bin
pkgver=2.2.4
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('6612b1e799391433551d35247fdcfd56908d7d1c0843c51457dea6c0dbb1e3e9')
sha256sums_aarch64=('eba904e79946cd89042fc94ea42a31fc75111bc2a9a39abf86f157c100cb0f52')

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
