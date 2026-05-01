# Maintainer: klrmngr <kaimingzhang1234@gmail.com>
pkgname=continuity-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A self-hosted personal changelog and activity tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/lazypower/continuity"
license=('MIT')
provides=('continuity')
conflicts=('continuity')

source_x86_64=("continuity-linux-amd64::https://github.com/lazypower/continuity/releases/download/v${pkgver}/continuity-linux-amd64")
source_aarch64=("continuity-linux-arm64::https://github.com/lazypower/continuity/releases/download/v${pkgver}/continuity-linux-arm64")

sha256sums_x86_64=('e4cc6cb766d1f95aad2807cd0e1d2b393d94c404666cfd3c7fe459a257f314a4')
sha256sums_aarch64=('e2d1ec4c2cc1a5506b61affaebe0fd9be9bd56b90098f810f2ab191101d4f245')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/continuity-linux-amd64"  "${pkgdir}/usr/bin/continuity" ;;
        aarch64) install -Dm755 "${srcdir}/continuity-linux-arm64"  "${pkgdir}/usr/bin/continuity" ;;
    esac
}
