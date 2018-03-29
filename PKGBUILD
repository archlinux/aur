# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>
pkgname=torrentv-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="Stream Torrents to your AppleTV/Roku/Chromecast"
arch=('x86_64' 'i686')
url="http://torrentv.github.io/"
license=('GPL3')

source=("$pkgname.desktop")
sha1sums=('167dd21bff7a803192cc7a7f98a0c0bd2f5e00d0')

source_x86_64=("torrentv-$CARCH.tar.gz::http://goo.gl/zZUOXk")
sha1sums_x86_64=("b66190c64258fc8f13fae036842f9c46d4c770d1")

source_i686=("torrentv-$CARCH.tar.gz::http://goo.gl/vlVWHw")
sha1sums_i686=("630366626cacf74a48c91690ba869860bd6ad8ed")

depends=('gconf' 'nss' 'libxtst' 'alsa-lib')

package() {
    cd "$srcdir/TorrenTV"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 TorrenTV "$pkgdir/opt/torrentv/TorrenTV"
    install -Dm644 nw.pak "$pkgdir/opt/torrentv/nw.pak"
    install -Dm644 libffmpegsumo.so "$pkgdir/opt/torrentv/libffmpegsumo.so"
}


