# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.20.2
_debpkgver=4.20.2-102avx2
pkgrel=2
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('hqplayer' 'qt6-webengine')
source=("https://www.signalyst.com/bins/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('068256038876cc570876d0bfe26efbd5c5e29be966864bfb03da6838b8ecc60a')
options=(!strip)
install=${pkgname}.install

package() {
bsdtar xf data.tar.zst
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
#install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
