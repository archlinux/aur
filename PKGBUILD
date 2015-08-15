# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.10.2
pkgrel=3
pkgdesc='AirVPN client "Eddie", beta version. Based on OpenVPN and operated by activists and hacktivists
in defense of net neutrality, privacy and against censorship.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(gksu mono openvpn stunnel)
provides=('airvpn')
conflicts=('airvpn' 'airvpn-bin')
install=airvpn.install
source_i686=("https://airvpn.org/repository/experimental/airvpn_linux_x86_debian.deb")
source_x86_64=("https://airvpn.org/repository/experimental/airvpn_linux_x64_debian.deb")
md5sums_i686=('341a03823f6289ed4b66a6cc2cd304e0')
md5sums_x86_64=('b85213cdbef363ca5d53372b7577ff47')
sha256sums_i686=('78b0030aa39570b57cb79784cb4480ee2829a60953a3b81066bde2560db3cb21')
sha256sums_x86_64=('6a508167badcdad4cfb067d6b7dde46caec11670332763bffaca50d64c8e3680')

package() {
  msg2 "Extracting the data.tar.lzma..."
  bsdtar -xf data.tar.gz

  msg2 "Moving stuff in place..."
  install -Dm755 "$srcdir/usr/lib/AirVPN/AirVPN.exe" "$pkgdir/usr/lib/AirVPN//AirVPN.exe"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Core.dll" "$pkgdir/usr/lib/AirVPN/Lib.Core.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Forms.dll" "$pkgdir/usr/lib/AirVPN/Lib.Forms.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Platforms.Linux.dll" "$pkgdir/usr/lib/AirVPN/Platforms.Linux.dll"
  install -Dm755 "$srcdir/usr/lib/AirVPN/update-resolv-conf" "$pkgdir/usr/lib/AirVPN/update-resolv-conf"
  install -Dm755 "$srcdir/usr/bin/airvpn" "$pkgdir/usr/bin/airvpn"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/changelog.gz" "$pkgdir/usr/share/doc/airvpn/changelog.gz"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/copyright" "$pkgdir/usr/share/doc/airvpn/copyright"
  install -Dm644 "$srcdir/usr/share/man/man1/airvpn.1.gz" "$pkgdir/usr/share/man/man1/airvpn.1.gz"
  install -Dm644 "$srcdir/usr/share/pixmaps/AirVPN.png"  "$pkgdir/usr/share/pixmaps/AirVPN.png"
  cd "$srcdir/usr/share/applications"
  desktop-file-install -m 644 --add-category=KDE --dir "$pkgdir/usr/share/applications/" "AirVPN.desktop"
}
