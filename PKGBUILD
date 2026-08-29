# Maintainer: Laoyou2333 <laoyou2333 at confidesk dot com>
pkgname=astral-game-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Astral Game"
arch=('x86_64')
url="https://next.Astral.fan"
license=('CC-BY-NC-ND 4.0')
provide=('astral')
depends=('polkit' 'libayatana-appindicator')
makedepends=('tar')
source=("https://github.com/AstralNext/AstralGame/releases/download/${pkgver}/astral-game-${pkgver}-linux-x64.tar.gz" "Astral Game.desktop")
sha256sums=('c38856713ae756f6e6592a5cbf237f2df48eb7ba3d512eae694c2edc981a159b'
            'c4cfe9ee4033175d968ae4423be3d3a1a4532b39b6627c9343497cd7cc4339c3')

package() {
    mkdir -p ${pkgdir}/opt/astral-game
    tar -xvf "${srcdir}/astral-game-${pkgver}-linux-x64.tar.gz" -C "${pkgdir}/opt/astral-game"
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/astral-game/astral_game" "${pkgdir}/usr/bin/astral_game"
    mkdir -p ${pkgdir}/usr/share/pixmaps
    ln -s "/opt/astral-game/data/flutter_assets/assets/icon.ico" "${pkgdir}/usr/share/pixmaps/Astral Game.ico"
    install -Dm644 "${srcdir}/Astral Game.desktop" "${pkgdir}/usr/share/applications/Astral Game.desktop"
}
