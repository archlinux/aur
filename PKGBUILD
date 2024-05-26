# Maintainer: Nep_Nep <nepnep91 at child dot pizza>

pkgname=simplex-desktop-bin
pkgver=5.7.4
pkgrel=1
pkgdesc="The first messaging network operating without user identifiers of any kind"
arch=(x86_64)
url="https://simplex.chat"
license=('AGPL-3.0')
source=("https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
sha256sums=('6be4ae69e47ebd7546ff2b3df446e40be26976b5a05fffbab46b43a105b13e04')
options=('!strip')

package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst
    cp -a opt "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"
}
