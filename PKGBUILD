# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer5
pkgver=5.7.4
_debpkgver=5.7.4-22
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer4')
source=("https://www.signalyst.com/bins/noble/hqplayer5desktop_"$_debpkgver"_amd64.deb")
sha256sums=('c6feb71c60b6456a39eb187bc1dcafbea9b52b402f4f85d415d2cccbe2089986')
options=(!strip)
install=${pkgname}.install

package() {
cd $srcdir
bsdtar xf data.tar.zst -C "$pkgdir"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer5desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer5desktop/copyright"
rm $pkgdir/usr/bin/hqplayer5client
rm $pkgdir/usr/share/applications/hqplayer5client.desktop
rm $pkgdir/usr/share/pixmaps/hqplayer5client.png
}
