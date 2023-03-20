## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=4.4.0-56
pkgver=4.4.0
pkgrel=1
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=('networkaudio.service')
source_armv7h=("https://www.signalyst.eu/bins/naa/linux/bullseye/networkaudiod_"$_debpkgver"_armhf.deb")
source_aarch64=("https://www.signalyst.eu/bins/naa/linux/bullseye/networkaudiod_"$_debpkgver"_arm64.deb")
source_x86_64=("https://www.signalyst.eu/bins/naa/linux/bullseye/networkaudiod_"$_debpkgver"_amd64.deb")
sha256sums=('75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_x86_64=('f828e0e0fa443f838155da93ec308776e52a614dd820cdf21f9951392493e70a')
sha256sums_armv7h=('2185d3803aed15ceb752cc6ee97a357405efefd3c81e386a6e9a0f7c9900f17f')
sha256sums_aarch64=('196538288dbd01b0f818f8e14ebff2f5f04ce00c15070df7ecd74a0a97a20fac')

package() {
bsdtar xf data.tar.xz -C "$srcdir"
  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

