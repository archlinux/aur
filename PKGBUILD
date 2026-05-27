# Maintainer: anirbanfaith <your@email.com>
pkgname=commitdog-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Zero-dependency git workflow CLI — commit, branch, PR, release"
arch=('x86_64' 'aarch64')
url="https://github.com/aysdog/commitdog"
license=('MIT')
provides=('commitdog')
conflicts=('commitdog')

source_x86_64=("commitdog-linux-amd64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-amd64")
source_aarch64=("commitdog-linux-arm64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-arm64")

sha256sums_x86_64=('9b61fbf88a381b7b8f5930a392137141652a2539370a97e19860eda9de6a4348')
sha256sums_aarch64=('d595031b3a4d74e7d0af798afa4abb91ef1e4f757dabf2c8f992898b3668e905')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/commitdog-linux-amd64" "${pkgdir}/usr/bin/commitdog"
    else
        install -Dm755 "${srcdir}/commitdog-linux-arm64" "${pkgdir}/usr/bin/commitdog"
    fi
}
