# Maintainer: Laoyou2333 <laoyou2333 at confidesk dot com>
pkgname=astral-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Astral is a modern cross-platform web application built on EasyTier, designed to simplify the creation and management of P2P network connections and virtual private networks."
arch=('x86_64')
url="https://Astral.fan"
license=('CC-BY-NC-ND 4.0')
provide=('astral')
depends=('polkit' 'libayatana-appindicator')
makedepends=('tar')
source=("https://github.com/ldoubil/astral/releases/download/v${pkgver}/astral-linux-x64.tar.gz" "https://github.com/ldoubil/astral/raw/refs/heads/main/assets/icon.ico" "Astral.desktop")
sha256sums=('4964d50c01e011d555f4336b5a6d019567a5b204f0783c5934da31562580fff4' 'd0e0314aa2aafc676ad7d3ddab38b173ed70cede661840d82756aaf85d3f36ca' '41b3f3f0e5b6df838d8a670e4c64bd7fd4bb531147bb59f46a86d22e189d8c19')

package() {
    mkdir -p ${pkgdir}/opt/astral
    tar -xvf "${srcdir}/astral-linux-x64.tar.gz" -C "${pkgdir}/opt/astral"
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/astral/astral" "${pkgdir}/usr/bin/astral"
    install -Dm644 "${srcdir}/icon.ico" "${pkgdir}/usr/share/pixmaps/Astral.png"
    install -Dm644 "${srcdir}/Astral.desktop" "${pkgdir}/usr/share/applications/Astral.desktop"
}
