## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=4.1.1-46
pkgver=4.1.1
pkgrel=2
_pkgrel_x86_64=2
_pkgrel_armv7h=2
_pkgrel_aarch64=2
pkgdesc="Signalyst Network Audio Daemon"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'glibc')
source_armv7h=("https://www.signalyst.eu/bins/naa/linux/buster/networkaudiod_"$_debpkgver"_armhf.deb" 'networkaudio.service')
source_aarch64=("https://www.signalyst.eu/bins/naa/linux/buster/networkaudiod_"$_debpkgver"_arm64.deb" 'networkaudio.service')
source_x86_64=("https://www.signalyst.eu/bins/naa/linux/bionic/networkaudiod_"$_debpkgver"_amd64.deb" 'networkaudio.service')
sha256sums_x86_64=('SKIP' '75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_armv7h=('SKIP' '75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')
sha256sums_aarch64=('SKIP' '75d45b226dcbb78dfb61e941ee5ef2a8f0d88efbf414d2618b42520fe3cb129e')

package() {
bsdtar xf data.tar.xz -C "$srcdir"
  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

