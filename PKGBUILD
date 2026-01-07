# Maintainer: RayZ3R0 <z3r069@tutanota.com>
pkgname=sonami-bin
pkgver=0.1.1_alpha.8
_upstream_ver=0.1.1-alpha.8
pkgrel=1
pkgdesc="A tauri music player (Binary)"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('AGPL3')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'alsa-lib' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RayZ3R0/sonami/releases/download/v${_upstream_ver}/sonami_${_upstream_ver}_linux_x86_64.tar.gz")
sha256sums=('6473862fdc6e3fcc03521cfb925227869286ce090d45345d5c92d51f6cbbc644')

package() {
    cd "${srcdir}/sonami"

    # Install the binary
    install -Dm755 sonami "$pkgdir/usr/bin/sonami"

    # Install the desktop file
    install -Dm644 sonami.desktop "$pkgdir/usr/share/applications/sonami.desktop"

    # Install the icon
    install -Dm644 sonami.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sonami.png"
}
