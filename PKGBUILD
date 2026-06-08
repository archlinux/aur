# Maintainer: Sparkenstein <zetabytes.pp@gmail.com>
pkgname=waterfowl-bin
_pkgname=waterfowl
pkgver=0.2.2
pkgrel=1
pkgdesc="Desktop PostgreSQL database manager built with Tauri"
arch=('x86_64')
url="https://github.com/fosslife/waterfowl"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('waterfowl')
conflicts=('waterfowl')
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/Waterfowl-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d075e7a989179fe0deebc0694e9614a749d5dd3eb1204896f034b5ffaa0e8757')

package() {
    # The upstream .deb already lays out /usr/bin, /usr/share/applications and
    # /usr/share/icons exactly as we want them — just extract it into $pkgdir.
    tar -xf data.tar.gz -C "${pkgdir}"
}
