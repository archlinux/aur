# Maintainer: Roman Alenichev (vicimpa@ya.ru)

pkgname=chatroulette
pkgver=0.0.1
pkgrel=1
pkgdesc="ChatRoulette desktop client whithout blocking virtual camera."
arch=('x86_64')
url="https://github.com/vicimpa/chatroulette"
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'libegl' 'libgles')
optdepends=('gnome-keyring')
source=("chatroulette-${pkgver}-${pkgrel}.tar.gz::https://github.com/vicimpa/chatroulette/releases/download/0.0.1/ChatRoulette-linux-0.0.1.tar.xz")
sha256sums=('d2b4aa7dde73c891b6360162e6a148f55685f9bfca84df828d95e3d3ef4c6d9d')

package() {
    mkdir -p "${pkgdir}/usr/lib/chatroulette"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    mv "${srcdir}/"* "${pkgdir}/usr/lib/chatroulette"

    cp "${startdir}/chatroulette.desktop" "${pkgdir}/usr/share/applications"
    cp "${startdir}/icon.png" "${pkgdir}/usr/share/pixmaps/chatroulette.png"

    chmod +x "${pkgdir}/usr/lib/chatroulette/ChatRoulette"
}