# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface-bin
pkgver=0.8.6
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
b2sums=('69185d9d3a261f558e5ca754a79a59196efae2b9dfef24834a94d9fbb7f9b0708c0599cb41d22070681bb7d7566dfa59ad8103124071de8cd3cd3c185f953591'
        'b91515e242fd17052d82ed136861dcd9ccadca1314157123a7b2e31fbcf2a58864b271cb5068b83832278b18c30d550329924050f674f39e1d6687a8431062c8')
options=('!lto')

package() {
    install -Dm644 flowsurface.desktop "${pkgdir}/usr/share/applications/flowsurface.desktop"
    install -Dm755 "bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

