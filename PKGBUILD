## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=5.0.2-61
pkgver=5.0.2
pkgrel=1
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=('networkaudio.service')
source_armv7h=("https://www.signalyst.eu/bins/naa/linux/bookworm/networkaudiod_"$_debpkgver"_armhf.deb")
source_aarch64=("https://www.signalyst.eu/bins/naa/linux/bookworm/networkaudiod_"$_debpkgver"_arm64.deb")
source_x86_64=("https://www.signalyst.eu/bins/naa/linux/bookworm/networkaudiod_"$_debpkgver"_amd64.deb")
sha256sums=('75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_x86_64=('3f10b542251be495a8dbb521ef15ed949e13083f75155a539560a742dd234eb4')
sha256sums_armv7h=('34ee2f91dc4f494aa55649b4c658f877025b1dd1e8a959e8eca450cd38b6afcb')
sha256sums_aarch64=('5f341718ef254ecd26e0b8e4afb0146c00be813c17229488a3b34abf0b85caca')

package() {
 bsdtar xf data.tar.xz -C "$srcdir"

  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

