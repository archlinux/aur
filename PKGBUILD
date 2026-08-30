# Maintainer: Laoyou2333 <laoyou2333 at confidesk dot com>
pkgname=astral-bin
pkgver=2.9.12
pkgrel=1
pkgdesc="Astral is a modern cross-platform web application built on EasyTier, designed to simplify the creation and management of P2P network connections and virtual private networks."
arch=('x86_64')
url="https://Astral.fan"
license=('CC-BY-NC-ND 4.0')
provide=('astral')
depends=('polkit' 'libayatana-appindicator')
makedepends=('tar')
source=("https://github.com/ldoubil/astral/releases/download/v${pkgver}/astral-linux-x64.tar.gz" "Astral.desktop")
sha256sums=('d4c7a0bf14501dc18d7e85ed1ef6cccfab3df4f6d82a8eb13f6f4f775e753e09'
            '44e13ca1fae1ce2e19c481923706b050fd39847ffae8033a8b382d740ef84131')

package() {
    mkdir -p ${pkgdir}/opt/astral
    tar -xvf "${srcdir}/astral-linux-x64.tar.gz" -C "${pkgdir}/opt/astral"
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/astral/astral" "${pkgdir}/usr/bin/astral"
    mkdir -p ${pkgdir}/usr/share/pixmaps
    ln -s "/opt/astral/data/flutter_assets/assets/icon.ico" "${pkgdir}/usr/share/pixmaps/Astral.ico"
    install -Dm644 "${srcdir}/Astral.desktop" "${pkgdir}/usr/share/applications/Astral.desktop"
}
