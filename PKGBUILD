## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=6.1.4-71
pkgver=6.1.4
pkgrel=1
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source=('networkaudio.service')
source_aarch64=("https://www.signalyst.com/bins/naa/linux/trixie/networkaudiod_"$_debpkgver"_arm64.deb")
source_x86_64=("https://www.signalyst.com/bins/naa/linux/trixie/networkaudiod_"$_debpkgver"_amd64.deb")
sha256sums=('75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_x86_64=('96bf8525cd61efdcc734213a1e5e1a03afa8807b3c39172bed5fdf19368d5139')
sha256sums_aarch64=('461f00ba3b5613961fa9e189a5b1df702f35b59cfcdd97cc66554ae7da21628c')

package() {
 bsdtar xf data.tar.xz -C "$srcdir"

  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/usr/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

