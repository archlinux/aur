## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-network-audio-daemon
_debpkgver=4.5.0-57
pkgver=4.5.0
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
sha256sums_x86_64=('693654eff046ca5be7e5a3c782a74edf068f65a6ce9190a483189c752051b451')
sha256sums_armv7h=('be1b369ed4c6cde46bbe045777d347038f14797a4e199b7ce45cba794732f8bf')
sha256sums_aarch64=('d66a268a55d1a53037e6ea355a7e9d2ca07f912f8401c565f62c021b3af5cc63')

package() {
bsdtar xf data.tar.xz -C "$srcdir"
  install -Dm644 "$srcdir/etc/default/networkaudiod" "$pkgdir/etc/default/networkaudiod"
  install -Dm644 "$srcdir/etc/networkaudiod/networkaudiod.xml" "$pkgdir/etc/networkaudiod/networkaudiod.xml"
  install -Dm644 "$srcdir/lib/systemd/system/networkaudiod.service" "$pkgdir/usr/lib/systemd/system/networkaudio.service"
  install -Dm644 "$srcdir/networkaudio.service" "$pkgdir/usr/lib/systemd/user/networkaudio.service"
  install -Dm644 "$srcdir/usr/share/doc/networkaudiod/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "$srcdir/usr/sbin/networkaudiod" "$pkgdir/usr/bin/networkaudiod"
}

