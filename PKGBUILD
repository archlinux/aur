# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer5
pkgver=5.5.1
_debpkgver=5.5.1-14avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
conflicts=('hqplayer4')
source=("https://www.signalyst.com/bins/jammy/hqplayer5desktop_"$_debpkgver"_amd64.deb")
sha256sums=('cf5d8665151f767512fa65132c8e03484491fc4daed22a597bb253547b1fe2e8')
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
