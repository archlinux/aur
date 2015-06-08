## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=3.0.0
pkgver=$_debpkgver
pkgrel=6
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=("https://www.signalyst.eu/bins/naa/v3/jessie/networkaudiod_3.0.0-22_amd64.deb" 'networkaudio@.service' 'copyright')
sha256sums=('f072f63e4ab228a5c3500a54735b67e30ed097535af48af2c96e01572e5ea5ca' 'fe16438e5905dbe0cea2d49404aa7bed6cf7f1ab1769c3cbcccc664ebd3dd309' '9dfe227985be1cb760d1ac3166b13e46345c64132f47a3f18f82ec0d5c121118')

package() {
  install -Dm644 "networkaudio@.service" \
    "$pkgdir/usr/lib/systemd/system/networkaudio@.service"
  install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
bsdtar xf data.tar.xz -C "$srcdir"
  
  install -Dm644 "$srcdir/etc/default/networkaudiod" \
     "$pkgdir/etc/default/networkaudiod"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" \
     "$pkgdir/usr/bin/networkaudiod"
}