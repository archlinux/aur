## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=4.6.0-58
pkgver=4.6.0
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
sha256sums_x86_64=('b25936138f4a020178011d43afba295d811619c751afbf1ef895128ac6e3db7c')
sha256sums_armv7h=('959a7e17a68a9133db3e700a20d6054b42290b9742d0d062aeb224fa5ef20c2f')
sha256sums_aarch64=('a1679e4e3e7b4bbcca2e68986cc7e6ce575d1b9393c74a651654a69a9eba4f39')

package() {
bsdtar xf data.tar.xz -C "$srcdir"
  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

