# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.17.2
_rpmpkgver=4.17.2-53
pkgrel=4
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'openmp' 'qt5-base' 'qt5-webengine' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("https://www.signalyst.eu/bins/hqplayer/fc35/hqplayer4desktop-$_rpmpkgver.fc35.x86_64.rpm")
sha256sums=('SKIP')
options=(!strip)

package() {
 bsdtar xf hqplayer4desktop-"$_rpmpkgver".fc35.x86_64.rpm -C "$pkgdir"
 rm -rf /usr/lib/build-id
 install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE"
}
