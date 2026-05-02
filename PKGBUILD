# Maintainer: anirbanfaith <your@email.com>
pkgname=commitdog-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Zero-dependency git workflow CLI — commit, branch, PR, release"
arch=('x86_64' 'aarch64')
url="https://github.com/aysdog/commitdog"
license=('MIT')
provides=('commitdog')
conflicts=('commitdog')

source_x86_64=("commitdog-linux-amd64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-amd64")
source_aarch64=("commitdog-linux-arm64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-arm64")

sha256sums_x86_64=('a21eadefc4f5c5e05f26f68eeb9e488dce023f98a2d53fa1a3bd8907dc4a21f0')
sha256sums_aarch64=('43d4b05d4a121f8dd29e11200d503523b0b6391523c13346b1216592d3046aad')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/commitdog-linux-amd64" "${pkgdir}/usr/bin/commitdog"
    else
        install -Dm755 "${srcdir}/commitdog-linux-arm64" "${pkgdir}/usr/bin/commitdog"
    fi
}
