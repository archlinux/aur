# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.21.0
_debpkgver=4.21.0-104avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer-embedded-amd' 'hqplayer-embedded-sse' 'hqplayer-embedded')
provides=('hqplayer')
source=("https://www.signalyst.com/bins/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('c8cd2431ea9b77238bab8a810f12990f3d34f87ec8abb94daccc5cd1de80645f')
options=(!strip)
install=${pkgname}.install

package() {
cd $srcdir
bsdtar xf data.tar.zst -C "$pkgdir"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer4desktop/copyright"
install -Dm755 "$pkgdir"/opt/hqplayer4desktop/lib/libsgllnx64-2.29.02.so "$pkgdir"/usr/lib/libsgllnx64-2.29.02.so
rm -rf "$pkgdir/opt"
rm $pkgdir/usr/bin/hqplayer4client
rm $pkgdir/usr/share/applications/hqplayer4-client.desktop
rm $pkgdir/usr/share/pixmaps/hqplayer4-client.png
}
