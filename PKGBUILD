# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.20.0
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
sha256sums_x86_64=('aeef6783eaefa8f65bda7f9134b9a7b33f9f032fb463654ac9217cbaa9672229')
sha512sums_x86_64=('17618bf89f86dc0b16fe58b888bc4710bcbeada0200e38b6d4843cb2deabc3e44d850c8b1c8369bd7efebdfbc2836a56e2053c388641df19c20d29d7440b2ba5')


package() {
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/{*.pem,*.png,*.json,lang/*},pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
