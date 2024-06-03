# Maintainer: Nep_Nep <nepnep91 at child dot pizza>

pkgname=simplex-desktop-bin
pkgver=5.8.0
pkgrel=1
pkgdesc="SimpleX Chat, the first messaging network operating without user identifiers of any kind"
arch=(x86_64)
url="https://simplex.chat"
license=('AGPL-3.0')
source=("https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
sha256sums=('1b5abc731b14b63ce6f2c697285b33dcad3c5fecd84fc8bcd2a620637a37eb89')

package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/simplex/bin/simplex "$pkgdir/usr/bin/simplex-desktop"
}
