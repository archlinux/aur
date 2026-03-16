# Maintainer: anirbanfaith <your@email.com>
pkgname=commitdog-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Zero-dependency git workflow CLI — commit, branch, PR, release"
arch=('x86_64' 'aarch64')
url="https://github.com/aysdog/commitdog"
license=('MIT')
provides=('commitdog')
conflicts=('commitdog')

source_x86_64=("commitdog-linux-amd64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-amd64")
source_aarch64=("commitdog-linux-arm64::https://github.com/aysdog/commitdog/releases/download/v${pkgver}/commitdog-linux-arm64")

sha256sums_x86_64=('ac3df2e586025c683a234e4c3de2533e870395b279190e7aa3128813b65ba094')
sha256sums_aarch64=('0cd805ec36149d0cb12b28c8ab1ad712109818ac124f5be087635943eee81ca0')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/commitdog-linux-amd64" "${pkgdir}/usr/bin/commitdog"
    else
        install -Dm755 "${srcdir}/commitdog-linux-arm64" "${pkgdir}/usr/bin/commitdog"
    fi
}
