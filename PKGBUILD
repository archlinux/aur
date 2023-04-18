# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.22.0
_debpkgver=4.22.0-108avx2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt6-base' 'qt6-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('hqplayer-client' 'evince: hqplayer manual reading')
source=("https://www.signalyst.com/bins/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('9f509cae33ff54c04040a00c42f5f4918cb91bfbfdcfbaf1c4ba51e758877233')
options=(!strip)
install=${pkgname}.install

package() {
cd $srcdir
bsdtar xf data.tar.zst -C "$pkgdir"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer4desktop/copyright"
rm $pkgdir/usr/bin/hqplayer4client
rm $pkgdir/usr/share/applications/hqplayer4-client.desktop
rm $pkgdir/usr/share/pixmaps/hqplayer4-client.png
}
