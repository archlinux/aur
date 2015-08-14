# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.9.2
_version=${pkgver%.*}
pkgrel=2
pkgdesc='AirVPN client "Eddie", stable version. Based on OpenVPN and operated by activists and hacktivists
in defense of net neutrality, privacy and against censorship.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(gksu mono openvpn stunnel)
provides=('airvpn')
conflicts=('airvpn' 'airvpn-beta-bin')
install=airvpn.install
source_i686=("https://airvpn.org/repository/${_version}/airvpn_linux_x86_debian.deb")
source_x86_64=("https://airvpn.org/repository/${_version}/airvpn_linux_x64_debian.deb")
md5sums_i686=('c3f1ed16b8e72b530c5786799bb13b89')
md5sums_x86_64=('edceba29c0ca6b58eb36478e12c2f71c')
sha256sums_i686=('8dcae5773fda5f0955dcbd19a2364ac700909b8ae3f564de298a9add5879575a')
sha256sums_x86_64=('2013ff2dc9f474a8d8fa95ef41a441a55e3b31c96a836ba17dad2bfc75da2c43')

package() {
  msg2 "Extracting the data.tar.lzma..."
  bsdtar -xf data.tar.gz

  msg2 "Moving stuff in place..."
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
