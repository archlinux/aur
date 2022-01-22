## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=4.1.3-49
pkgver=4.1.3
pkgrel=2
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
sha256sums_x86_64=('b73175a1d56a526da1dd0c7fcb9529237fdcecf0b2a9b395c929ba73b01703ff')
sha256sums_armv7h=('df9e8cc6f3015c1cbafae7de951d7bdd5a82e30c2656938359b6bd9297059c25')
sha256sums_aarch64=('8a6816d8ab8d0687f2b6441001ccb87f04a91f08de00dd38a356d1b7f8655cd8')

package() {
bsdtar xf data.tar.xz -C "$srcdir"
  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

