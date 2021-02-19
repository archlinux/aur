# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
_rpmver=4.10.1-29
pkgver=4.10.1
pkgrel=2
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("http://www.signalyst.eu/bins/hqplayer/fc33/hqplayer4desktop-"$_rpmver".fc33.x86_64.rpm")
sha256sums=('214fd7cd265107a76d1cdcd90fc50c1ceffbb103fed6c789dacf01bf368279b4')

package() {
 bsdtar xf hqplayer4desktop-"$_rpmver".fc33.x86_64.rpm -C "$pkgdir"
 rm -rf /usr/lib/build-id
 install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE"
}
