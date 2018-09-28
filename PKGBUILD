## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
pkgver=3.5.4
pkgrel=9
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=("https://www.signalyst.eu/bins/naa/linux/xenial/networkaudiod_3.5.4-38_amd64.deb" 'networkaudio.service' 'copyright')
sha256sums=('SKIP' '75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e' '9dfe227985be1cb760d1ac3166b13e46345c64132f47a3f18f82ec0d5c121118')

package() {
  install -Dm644 "networkaudio.service" \
    "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
bsdtar xf data.tar.xz -C "$srcdir"
  
  install -Dm644 "$srcdir/etc/default/networkaudiod" \
     "$pkgdir/etc/default/networkaudiod"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" \
     "$pkgdir/usr/bin/networkaudiod"
}
