# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer5
pkgver=5.15.1
_debpkgver=5.15.1-39
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3' 'x86_64_v4')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer4')
source=("https://www.signalyst.com/bins/noble/hqplayer5desktop_"$_debpkgver"_amd64.deb")
sha256sums=('5cff1dddc5a10b10f235dab3b5ca2d5eae89c9b08f32f94c9bccac0ad1b72fff')
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
