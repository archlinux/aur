# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.19.0
_rpmpkgver=4.19.0-56
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'libusb-compat' 'openmp' 'qt5-base' 'qt5-webengine' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack' 'mpg123')
optdepends=('evince: hqplayer manual reading')
conflicts=('hqplayer-embedded-amd' 'hqplayer-embedded')
source=("https://www.signalyst.eu/bins/hqplayer/fc35/hqplayer4desktop-$_rpmpkgver.fc35.x86_64.rpm")
sha256sums=('9e74817162a435076c2a9bafb23acd34761554cfa2e235022e1c611632e841a0')
options=(!strip)

package() {
bsdtar xf hqplayer4desktop-"$_rpmpkgver".fc35.x86_64.rpm -C "$pkgdir"
rm -rf /usr/lib/build-id
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE"
cp "$pkgdir"/opt/hqplayer4desktop/lib/* "$pkgdir"/usr/lib/
rm -rf "$pkgdir/opt"
}
