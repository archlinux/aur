# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface-bin
pkgver=0.8.8
pkgrel=1
pkgdesc="A native desktop charting platform for crypto markets"
arch=('x86_64')
url="https://github.com/flowsurface-rs/flowsurface"
license=('GPL-3.0-or-later')
depends=('libxkbcommon-x11')
provides=('flowsurface')
conflicts=('flowsurface')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/flowsurface-x86_64-linux.tar.gz"
        'flowsurface.desktop')
b2sums=('1a805239c5727ba67cf34fbe5de76a6deb497fcb17992edbd12edf8bd8ac1baba39cbd8ef7f147cd2728d77527e5a51374ccb2ee715390f7aa2a968eb3adc5d8'
        'b91515e242fd17052d82ed136861dcd9ccadca1314157123a7b2e31fbcf2a58864b271cb5068b83832278b18c30d550329924050f674f39e1d6687a8431062c8')
options=('!lto')

package() {
    install -Dm644 flowsurface.desktop "${pkgdir}/usr/share/applications/flowsurface.desktop"
    install -Dm755 "bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
