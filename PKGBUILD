# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.19.7
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, beta version.'
arch=('x86_64')
url=https://eddie.website
license=(GPL3)
depends=(mono openvpn sudo desktop-file-utils libnotify libappindicator-gtk2)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH' 'libappindicator-gtk2: Tray icon w/GTK 2' 'libappindicator-gtk3: Tray icon w/GTK 3')
makedepends=('cmake')
provides=('airvpn' 'eddie-ui')
conflicts=('airvpn' 'airvpn-bin' 'airvpn-git' 'eddie-ui-git')
install=airvpn.install
source_x86_64=("eddie-ui_${pkgver}_linux_x64_arch.tar.xz"::"https://airvpn.org/mirrors/eddie.website/download/?platform=linux&arch=x64&ui=ui&format=arch.tar.xz&version=${pkgver}")
sha256sums_x86_64=('e86fe50176e20028e5fe19ca60ffdb5652d64b7a23aa1acb22073ebe531cc6a6')
sha512sums_x86_64=('83be07f8aa0fb7663e47fc2a9a1444f3b81c097648c88098fc382fde1357dbddcb890d1661d7fe42160e618052945ca4e70cf458fbec8dc9c58fbc6f6ab59f47')


package() {
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/{*.pem,*.png,*.json,lang/*},pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
