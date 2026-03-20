# Maintainer: anirbanfaith <your@email.com>
pkgname=commitdog-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Zero-dependency git workflow CLI — commit, branch, PR, release"
arch=('x86_64' 'aarch64')
url="https://github.com/aysdog/commitdog"
license=('MIT')
provides=('commitdog')
conflicts=('commitdog')

source_x86_64=("commitdog-linux-amd64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-amd64")
source_aarch64=("commitdog-linux-arm64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-arm64")

sha256sums_x86_64=('6275118a7db7c8eb74f8b40f4b816852eafbade8324f08847c7486e4d14e90cb')
sha256sums_aarch64=('44cb153a8ac3429fa8bd21cd98ee130661184509a48f78f40f9418344f7a8e77')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/commitdog-linux-amd64" "${pkgdir}/usr/bin/commitdog"
    else
        install -Dm755 "${srcdir}/commitdog-linux-arm64" "${pkgdir}/usr/bin/commitdog"
    fi
}
