# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.19.2
_rpmpkgver=4.19.2-58
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt5-base' 'qt5-webengine' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer-embedded-amd' 'hqplayer-embedded')
provides=('hqplayer')
source=("https://www.signalyst.eu/bins/hqplayer/fc36/hqplayer4desktop-$_rpmpkgver.fc36.x86_64.rpm")
sha256sums=('5fc9ffaa1d41d1e72760f8cd68d067eae0dcfea428faa567dfc1659f041bdb8b')
options=(!strip)

package() {
bsdtar xf hqplayer4desktop-"$_rpmpkgver".fc36.x86_64.rpm -C "$pkgdir"
rm -rf /usr/lib/build-id
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE"
cp "$pkgdir"/opt/hqplayer4desktop/lib/* "$pkgdir"/usr/lib/
rm -rf "$pkgdir/opt"
rm $pkgdir/usr/bin/hqplayer4client
rm $pkgdir/usr/share/applications/hqplayer4-client.desktop
rm $pkgdir/usr/share/pixmaps/hqplayer4-client.png
}
