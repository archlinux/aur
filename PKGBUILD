# Maintainer: Nep_Nep <nepnep91 at child dot pizza>

pkgname=simplex-desktop-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="SimpleX Chat, the first messaging network operating without user identifiers of any kind"
arch=(x86_64)
url="https://simplex.chat"
license=('AGPL-3.0')
source=("https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
sha256sums=('dd2b10646186be2dbc9810a867365df94fd67a22735b77d512d91f3b991e4deb')

package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/simplex/bin/simplex "$pkgdir/usr/bin/simplex-desktop"
}
