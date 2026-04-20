# Maintainer: anirbanfaith <your@email.com>
pkgname=commitdog-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Zero-dependency git workflow CLI — commit, branch, PR, release"
arch=('x86_64' 'aarch64')
url="https://github.com/aysdog/commitdog"
license=('MIT')
provides=('commitdog')
conflicts=('commitdog')

source_x86_64=("commitdog-linux-amd64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-amd64")
source_aarch64=("commitdog-linux-arm64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-arm64")

sha256sums_x86_64=('edc5020083423ed4bbaf4568aacaf7fcd4c8f0cfb86603a5e9b6b1164546f4e7')
sha256sums_aarch64=('b0b92a3f3f341b2cd080949d149f007b72e2e1cbb3499d741d62247b0fb5b4f5')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/commitdog-linux-amd64" "${pkgdir}/usr/bin/commitdog"
    else
        install -Dm755 "${srcdir}/commitdog-linux-arm64" "${pkgdir}/usr/bin/commitdog"
    fi
}
