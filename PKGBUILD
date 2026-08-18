# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=ngpost-hydro74000
pkgver=5.4.2
pkgrel=1
pkgdesc="Command line and GUI Usenet poster - Hydro74000 fork"
arch=('any')
url="https://github.com/Hydro74000/ngPost"
license=('GPL-3.0-only')
provides=('ngpost')
conflicts=('ngpost')
depends=(
    'libstdc++'
    'qt6-base'
    'qt6-charts'
    'openssl'
)
optdepends=(
    'par2cmdline: par2 creation'
    'parpar: faster par2 creation'
    'rar: archive uploads using rar'
    '7zip: archive uploads using 7zip'
    'openvpn: VPN support'
    'wireguard-tools: VPN support'
    'polkit: VPN support'
    'qtkeychain-qt6: VPN support'
)
makedepends=(
    'qtkeychain-qt6'
)
source=("ngPost-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bab1b06d7e1965b99d5aec87fb63d1df30d43831a7abc906ec714580b24d79cc')

build() {
    cd ngPost-$pkgver/src
    qmake6 ngPost.pro
    make
}

package() {
    install -Dm755 ngPost-$pkgver/src/ngPost $pkgdir/usr/bin/ngPost
    install -Dm644 ngPost-$pkgver/ngPost.desktop $pkgdir/usr/share/applications/ngPost.desktop
    install -Dm644 ngPost-$pkgver/src/resources/icons/ngPost.png $pkgdir/usr/share/pixmaps/ngPost.png
}

