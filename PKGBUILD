# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface-bin
pkgver=0.8.10
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
b2sums=('0f88fececee79c77f40beed9bac53eec9ad4c4935316e9e9e336aae11a1b582e6238109f917b6e0ef5729ecc90c6128fdbdf62d405f68a5c41e37d3d1cf4e412'
        'b91515e242fd17052d82ed136861dcd9ccadca1314157123a7b2e31fbcf2a58864b271cb5068b83832278b18c30d550329924050f674f39e1d6687a8431062c8')
options=('!lto')

package() {
    install -Dm644 flowsurface.desktop "${pkgdir}/usr/share/applications/flowsurface.desktop"
    install -Dm755 "bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
