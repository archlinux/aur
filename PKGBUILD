# Maintainer: Laoyou2333 <laoyou2333 at confidesk dot com>
pkgname=astral-bin
pkgver=2.9.10
pkgrel=2
pkgdesc="Astral is a modern cross-platform web application built on EasyTier, designed to simplify the creation and management of P2P network connections and virtual private networks."
arch=('x86_64')
url="https://Astral.fan"
license=('CC-BY-NC-ND 4.0')
provide=('astral')
depends=('polkit' 'libayatana-appindicator')
makedepends=('tar')
source=("https://github.com/ldoubil/astral/releases/download/v${pkgver}/astral-linux-x64.tar.gz" "https://github.com/ldoubil/astral/raw/refs/heads/main/assets/icon.ico" "Astral.desktop")
sha256sums=('8e5a0a0f6dd1f855a9801d577e7e9eca77f41efed346c5e21f8188be9d347afa'
            'd0e0314aa2aafc676ad7d3ddab38b173ed70cede661840d82756aaf85d3f36ca'
            '44e13ca1fae1ce2e19c481923706b050fd39847ffae8033a8b382d740ef84131')

package() {
    mkdir -p ${pkgdir}/opt/astral
    tar -xvf "${srcdir}/astral-linux-x64.tar.gz" -C "${pkgdir}/opt/astral"
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/astral/astral" "${pkgdir}/usr/bin/astral"
    install -Dm644 "${srcdir}/icon.ico" "${pkgdir}/usr/share/pixmaps/Astral.png"
    install -Dm644 "${srcdir}/Astral.desktop" "${pkgdir}/usr/share/applications/Astral.desktop"
}
