# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=6.0.2
_debpkgver=6.0.2-3
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('qt6-webengine' 'qt6-5compat')
optdepends=('hqplayer6' 'hqplayer-embedded' 'hqplayer-embedded-sse')
source=("https://www.signalyst.com/bins/noble/hqplayer6desktop_"$_debpkgver"_amd64.deb")
sha256sums=('2f1d04ee533b94b978e2cefe4f5ec92668cacdd2a65c96c3e625c30497a54f6e')
options=(!strip)
install=${pkgname}.install

package() {
bsdtar xf data.tar.zst
install -Dm755 $srcdir/usr/bin/hqplayer6client $pkgdir/usr/bin/hqplayer6client
install -Dm644 $srcdir/usr/share/applications/hqplayer6client.desktop $pkgdir/usr/share/applications/hqplayer6client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer6client.png $pkgdir/usr/share/pixmaps/hqplayer6client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer6desktop/copyright $pkgdir/usr/share/licenses/$pkgname/COPYING
}
