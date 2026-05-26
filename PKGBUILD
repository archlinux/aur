# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer6
pkgver=6.0.0
_debpkgver=6.0.0-1
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer4')
source=("https://www.signalyst.com/bins/noble/hqplayer6desktop_"$_debpkgver"_amd64.deb")
sha256sums=('e2d4f4e3b701f0812920b6b0da23e0f9c40e0291d90738af5cd00086c4498bd8')
options=(!strip)
install=${pkgname}.install

package() {
cd $srcdir
bsdtar xf data.tar.zst -C "$pkgdir"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer6desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer6desktop/copyright"
rm $pkgdir/usr/bin/hqplayer6client
rm $pkgdir/usr/share/applications/hqplayer6client.desktop
rm $pkgdir/usr/share/pixmaps/hqplayer6client.png
}
