# Maintainer: 3uzbcqje <3uzbcqje@addy.to>
pkgname=aws-sso-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="A secure replacement for aws configure sso"
arch=('x86_64' 'aarch64')
url="https://github.com/synfinatic/aws-sso-cli"
license=('GPL-3.0-or-later')
provides=('aws-sso')
conflicts=('aws-sso')
source_x86_64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-amd64")
source_aarch64=("https://github.com/synfinatic/aws-sso-cli/releases/download/v${pkgver}/aws-sso-${pkgver}-linux-arm64")
sha256sums_x86_64=('760ecc85c2e4fc5d13d5b035dfc32bb5161c5ff1887e0314176f8658e7d841ae')
sha256sums_aarch64=('bd120d7711fbc90cc32539a6cbd0411e736b0cfe773285c53716fd0627498a9c')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/aws-sso-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/aws-sso"
    else
        install -Dm755 "${srcdir}/aws-sso-${pkgver}-linux-arm64" "${pkgdir}/usr/bin/aws-sso"
    fi
}
