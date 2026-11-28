# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-gui-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="LianWall GUI - Qt Quick wallpaper player and library manager"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/Yueosa/lianwall-gui"
license=('LicenseRef-LianWall')
depends=('lianwalld-bin>=6.0.0' 'qt6-base>=6.12' 'qt6-base<6.13' 'qt6-declarative>=6.12' 'qt6-declarative<6.13' 'ffmpeg')
optdepends=('lianwall-bin: CLI client for lianwalld')
provides=("lianwall-gui=$pkgver")
conflicts=('lianwall-gui')
source=("lianwall-gui-${pkgver}::https://github.com/Yueosa/lianwall-gui/releases/download/v${pkgver}/lianwall-gui_${pkgver}_linux_x86_64"
        "lianwall.png-${pkgver}::https://raw.githubusercontent.com/Yueosa/lianwall-gui/v${pkgver}/resources/icons/lianwall.png"
        "lianwall-gui.desktop-${pkgver}::https://raw.githubusercontent.com/Yueosa/lianwall-gui/v${pkgver}/packaging/lianwall-gui.desktop"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Yueosa/lianwall-gui/v${pkgver}/LICENSE")
sha256sums=('b69d8df567a6017b2f7b9d51c28ea3b3974a6452a13081acb6986840bb8d5989'
            'fde2d2388bc059c25d5b8dc68bed3183475f4d8bfdd8227bb1b2c8c6904c028e'
            'a6f5b58d83aeb98bb9c1a9622290e2b0d04424f90cf0706c03671587bbfa692e'
            '051973239643c829b13ced4aea4820f2dc90fb1eaa202976d90946b08ea3487d')

package() {
    install -Dm755 "lianwall-gui-${pkgver}" "$pkgdir/usr/bin/lianwall-gui"
    install -Dm644 "lianwall.png-${pkgver}" "$pkgdir/usr/share/pixmaps/lianwall.png"
    install -Dm644 "lianwall-gui.desktop-${pkgver}" "$pkgdir/usr/share/applications/lianwall-gui.desktop"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
