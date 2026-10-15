# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer6
pkgver=6.1.1
_debpkgver=6.1.1-5
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer4' 'hqplayer5')
source=("https://www.signalyst.com/bins/resolute/hqplayer6desktop_"$_debpkgver"_amd64.deb")
sha256sums=('10a0449e71d0f2a79c2d62161626b9d6fe89b5c3937256927b352c7078f9ade1')
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
