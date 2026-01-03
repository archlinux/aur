## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=6.1.0-68
pkgver=6.1.0
pkgrel=1
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=('networkaudio.service')
source_aarch64=("https://www.signalyst.com/bins/naa/linux/trixie/networkaudiod_"6.1.1-69"_arm64.deb")
source_x86_64=("https://www.signalyst.com/bins/naa/linux/trixie/networkaudiod_"$_debpkgver"_amd64.deb")
sha256sums=('75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_x86_64=('c4b68da8e1fec91a156df4234baeaf4a5a65fcdfc40c6ea66de3bf4d549a7dd3')
sha256sums_aarch64=('b7142d91214ea0efb142a5ac5f306eea56bce081cd82321a7cfe8becb720ea1c')

package() {
 bsdtar xf data.tar.xz -C "$srcdir"

  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/usr/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

